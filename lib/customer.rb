require_relative "order_processor"

class Customer 

	def initialize menu: ::BASIC_MENU, dish_presenter: BasicPresenter, input_parser: BasicInputParser, order_processor: order_processor
		@menu 				   = menu
		@dish_presenter  = dish_presenter
		@input_parser    = input_parser
		@order_processor = order_processor
	end

	def print_menu
		menu.each do |dish, attrs|
			dish_presenter.call( dish: dish, price: attrs[ :price ] ) 
		end
	end

	def take_order
		puts "Give your order with this format:"
		puts "potatoes: 1, carrots: 2, price: 10"

		process_order input_parser.call( gets.chomp )
		
	end

	private

	attr_reader :order_handler, :menu, :dish_presenter, :input_parser, :order_processor

	def process_order order
		order_processor.process order
	end

end

BASIC_MENU = {
  potatoes: {
    price: 10,
  },
  carrots:  {
    price: 5,
  }, 
  whatever: {
    price: 15,
  },
  beef:     {
    price: 20,
  },
  beer:     {
    price: 4 
  }
}

Customer::BasicPresenter = ->(opts = {}) do
  puts "#{opts[:dish]} - #{opts[:price]}} $"
end

Customer::BasicInputParser = ->(input) do 
    input.split(',').map { |e| e.split(':').map(&:strip) }  
end
