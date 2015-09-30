class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :creator_id
      t.references :user, index: true
      t.integer  :skill_id
      t.integer :rating, :default => 0
      t.integer :minutes, :default => 60
      t.boolean :completed, :default => false
      t.timestamps null: false
    end
  end
end
