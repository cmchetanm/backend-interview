class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.float :amount, default: 0.0
      t.integer :status
      t.integer :country_code
      t.integer :account_id
      t.string :message
      t.boolean :point_creadit, default: false
      t.integer :reward_name
      t.timestamps
    end
  end
end
