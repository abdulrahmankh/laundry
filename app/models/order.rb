class Order < ActiveRecord::Base

	belongs_to :customer
	belongs_to :user
	belongs_to :product
	has_many :order_items
	has_many :payments


	def calc_total_price
		order_items = OrderItem.where('order_id = ?', self.id)
		total = 0
		order_items.each do |order|
			total += (order.quantity * order.product.price)
		end
		self.total_price = total
		self.save
	end

end
