class CreatePoints < ActiveRecord::Migration[7.0]
  def change
    create_table :points do |t|
      t.integer :earning_point
      t.integer :account_id
      t.timestamps
    end
  end
end
