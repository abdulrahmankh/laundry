class OrderItem < ActiveRecord::Base

	belongs_to :order
	belongs_to :product

	validates :quantity, presence: true
	validate :more_than_zero

	before_create :update_old_same_item
	after_create :delete_if_old
	after_save :update_order_total_price
	after_destroy :update_order_total_price
	
	def more_than_zero
		if  !self.quantity.present? || self.quantity <= 0 
			error_message = " must be more than zero!"
			errors.add(:quantity, error_message)
		end
	end

	def update_old_same_item
		item = OrderItem.where('order_id = ? and product_id = ?', self.order_id, self.product_id).first
		if item
			item.quantity = self.quantity + item.quantity
			item.save
		end
	end

	def delete_if_old
		item_count = OrderItem.where('order_id = ? and product_id = ?', self.order_id, self.product_id).count
		if item_count > 1
			self.destroy
		end
	end


	def update_order_total_price
		order = Order.find_by_id(self.order_id)
		order.calc_total_price
	end


end
