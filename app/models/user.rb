class User < ActiveRecord::Base

	has_many :products
	has_many :customers
	has_many :orders
	has_many :customers
	has_many :order_items, :through => :order

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

     def check_order_ownership(order_id)
		#checking the the params[:order_id] is owned by the current user
		    if self.orders.find_by_id(order_id)
		      return true
		    end
	    return false
	end

end
