class CreateRewards < ActiveRecord::Migration[7.0]
  def change
    create_table :rewards do |t|
      t.string :name
      t.string :country_code
      t.float :print
      t.string :reward_type
      t.integer :user_id

      t.timestamps
    end
  end
end
