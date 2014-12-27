class CreateDiscountInfos < ActiveRecord::Migration
  def change
    create_table :discount_infos do |t|
      t.decimal :amount
      t.decimal :discount
      t.boolean :active

      t.timestamps
    end
  end
end
