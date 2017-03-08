class Order < ApplicationRecord

	def decrement(value)
		value - @order.order_quantit 
	end

end
