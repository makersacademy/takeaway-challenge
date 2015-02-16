class MessageSender

	attr_reader :order_time, :delivery_time

	def set_order_time(time)
		@order_time = time.to_s.slice(11,5)
	end

	def order_time
		@order_time
	end

	def delivery_time
		array = order_time.split(":")	
		array[0] == "23" ? array[0] = "00" : array[0] = array[0].next 
		array.insert(1,":")
		array.join
	end

	def sms_message
		"Thank you! Your order was placed and will be delivered before #{delivery_time}"
	end
		
	def send_message
		self.sms_message
	end

end