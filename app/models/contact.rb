class Contact < ApplicationRecord
  belongs_to :user

  validates :name, :number, :email, :relation, presence: true
  validates :number, numericality: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :relation, inclusion: { in: %w[Family Friends Work Acquaintance] }
end
