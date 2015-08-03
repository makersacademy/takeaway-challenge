require_relative 'menu'
#require 'twilio-ruby'

class Customer

	attr_reader :pizzas_menu, :drinks_menu, :ordered_pizzas, :ordered_drinks, :pizzas_bill, :drinks_bill

	def initialize
		@pizzas_menu = {}
		@drinks_menu = {}
		@ordered_pizzas = []
		@ordered_drinks = []
		@pizzas_bill = []
		@drinks_bill = []
	end

	def show_pizzas(menu_class)
		@pizzas_menu = menu_class.pizzas
		@pizzas_menu
	end

	def show_drinks(menu_class)
		@drinks_menu = menu_class.drinks
		@drinks_menu
	end

	def pick_pizza(quantity, pizza)
		quantity.times do
			ordered_pizzas << pizza
			pizzas_bill << @pizzas_menu[pizza]
		end
		ordered_pizzas
	end

	def pick_drinks(quantity, drink)
		quantity.times do
			ordered_drinks << drink
			drinks_bill << @drinks_menu[drink]
		end
		ordered_drinks
	end

	def total_charge
		total_pizzas = pizzas_bill.inject(0) {|x,y| x + y}
		total_drinks = drinks_bill.inject(0) {|x,y| x + y}
		total = total_pizzas + total_drinks
		total
	end

	def place_order
		time = Time.now
		print 'Your order is:'
		print ordered_pizzas
		print pizzas_bill
		print ordered_drinks
		print drinks_bill
		print 'With a total charge of:'
		print self.total_charge
		print 'Your order was placed at ' + time.to_s

		#account_sid = 'ACa08e73f4ff7396cdd32929ec64cb9fbf'
		#auth_token = '{{ ACe1e63e18fe1393cd6a2a911f4bc5de9b }}'
		#@client = Twilio::REST::Client.new account_sid, auth_token

		#message = @client.account.messages.create(
		#	:body => "Your order was placed before" + Time.now + '. It will arrive in an hour. Thank you!',
		#	:to => "+447597208597",
		#	:from => "+447597208597",
		#	)
		#	puts message.to
	end
end