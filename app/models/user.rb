class User < ActiveRecord::Base

	has_many :products
	has_many :customers
	has_many :orders
	has_many :customers

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
