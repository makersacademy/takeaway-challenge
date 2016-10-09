class Takeaway

	attr_reader :orders, :menu

	DELIVERY_TIME = 30*60

	def initialize(menu)
		@orders = Array.new
		@menu = menu
		time = Time.now + DELIVERY_TIME
		@phone = Phone.new("+441163263609", "Thank you! Your order was placed and will be delivered #{time.strftime("before %I:%M%p")}")
	end

	def place(order)
		@orders << order.food
		send_text(order.phone_number)
	end

	private

	def send_text(phone_number)
		@phone.send_confirmation(phone_number)
	end

end
