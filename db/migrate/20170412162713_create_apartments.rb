class CreateApartments < ActiveRecord::Migration[5.0]
  def change
    create_table :apartments do |t|
      t.string :street_1
      t.string :street_2
      t.string :city
      t.integer :postal_code
      t.string :state
      t.string :country
      t.string :name
      t.integer :phone_number
      t.string :hours_to_contact

      t.timestamps
    end
  end
end
