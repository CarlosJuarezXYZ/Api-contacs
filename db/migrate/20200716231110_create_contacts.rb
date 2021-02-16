class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.integer :number
      t.string :email
      t.string :relation
      t.boolean :favorite, default: false

      t.timestamps
    end
  end
end
