require './lib/menu.rb'
require 'twilio-ruby'


class Order

	include Menu

	attr_accessor :dishes_ordered, :dish_count, :api
	def initialize
		@dishes_ordered = {}
		@dish_count = 0
	end	


	def add_items_to_order (dish, quantity = 1)
		fail "Order something on the menu!" unless menu.has_key? dish
		@dishes_ordered[dish] = (@dishes_ordered[dish] ? @dishes_ordered[dish] + quantity :  quantity )
		puts "You haved added #{quantity} #{dish} to your order"
		"You have ordered #{@dish_count = @dish_count + quantity} dishes in total"
	end


	def order_total
		@dishes_ordered.inject(0){|memo, (dish, quantity)| (menu[dish] * quantity) + memo}
	end

  def show_order
  	p dishes_ordered.map { |food, quantity| "Item: #{food} / Quantity: #{quantity}\n" }
  end


  # good order 
  # expect(subject).to receive(:sens_sms)
  # subject.checkout(correct_amount)

  # bad order
  # expect{subject.checkout(bad_anout)}.to raise_error "you didnt enter enough"

	def checkout(payment_amount)
    fail "You have not paid the correct amount." unless payment_amount == order_total
		send_sms
		"Order received. A text message confirmation will be sent to you shortly."
  end

  def send_sms
	account_sid = 'AC366be82341a0caa874700abafb319d6f'
	auth_token = '4d3edaf6282ef84872c67f85b90d6854'
		
		@client = Twilio::REST::Client.new(account_sid, auth_token)
		@client.messages.create ({
		  from: '+441406455046',
		  to: '+447500333666',
		  body: "Thank you! Your order was placed and will be delivered before #{(Time.new + 3600).strftime("%H:%M")}"})
  end

end