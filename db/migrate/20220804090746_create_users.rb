class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :address
      t.datetime :dob
      t.integer :gender
      t.string :full_phone_number
      t.integer :country_code
      t.bigint :phone_number
      t.integer :user_type
      t.timestamps
    end
  end
end
