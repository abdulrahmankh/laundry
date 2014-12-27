class Product < ActiveRecord::Base

	belongs_to :user
	has_many :orders
	has_many :order_items
end
