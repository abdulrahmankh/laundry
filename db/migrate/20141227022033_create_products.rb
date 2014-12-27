class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.integer :user_id
      t.boolean :discountable
      t.boolean :active

      t.timestamps
    end
  end
end
