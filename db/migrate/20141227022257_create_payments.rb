class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :order_id
      t.decimal :amount
      t.string :method
      t.integer :user_id

      t.timestamps
    end
  end
end
