class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.float :balance, default: 0.0
      t.string :point
      t.string :reward, array: true, default: []
      t.integer :user_id
      t.string :message
      t.timestamps
    end
  end
end
