require 'send_sms'

class Customer

	include Send_sms

	attr_reader :dish_list

	def initialize(dish_list = [])
		@dish_list = dish_list
	ends