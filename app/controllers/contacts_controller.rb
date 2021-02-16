class ContactsController < ApplicationController
  before_action :initial_setup, only: [:index]
  before_action :set_contact, only: %i[show edit update destroy]

  def index
    @contacts = current_user.contacts

    render json: @contacts
  end

  def show
    render json: @contact
  end

  def create
    @contact = current_user.contacts.new(contact_params)

    if @contact.save
      render json: @contact, status: :created, location: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  def update
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @contact.destroy
  end

  private

  def set_contact
    if current_user
      @contact = current_user.contacts.find(params[:id])
    else
      render json: { user: 'User not found' }, status: :unauthorized
    end
  end

  def contact_params
    params.require(:contact).permit(:name, :number, :email, :relation, :favorite)
  end

  def initial_setup
    unless current_user
      current_user = User.new(email: user_email_header)

      if current_user.save
        new_contacts = [
          { name: 'Andrew Clark', email: 'andrew@react.com', number: '975318642',
            relation: 'Work' },
          { name: 'Brian Vaughn', email: 'brian@react.com', number: '987654321',
            relation: 'Friends' },
          { name: 'Dan Abramov', email: 'dan@react.com', number: '123456789', relation: 'Friends' },
          { name: 'Dominic Gannaway', email: 'dominic@react.com', number: '135792468',
            relation: 'Acquaintance' },
          { name: 'Luna Ruan', email: 'luna@react.com', number: '222333444', relation: 'Work' }
        ]
        new_contacts.each { |contact| current_user.contacts.create(contact) }
      else
        render json: current_user.errors, status: :unprocessable_entity
      end

    end
  end
end
