require 'customer'

describe Customer do

	let( :customer      ) do 
		Customer.new order_handler, menu, dish_presenter, 
		input_parser, order_processor
	end

	let( :menu ) { double :menu, dish_presenter: nil }
	let( :order_processor ) { double :order_processor, :process => nil }
	let( :order) { :double }

	describe "#print_menu" do
		
		let( :puts ) { double }

		it "expects menu to respond_to dish_presenter" do
			expect( menu.dish_presenter ).to eq nil
			menu.dish_presenter
		end

		# it "displays the menu" do

		# 	expect( STDOUT ).to receive( :puts ).with("")
		# 	subject.print_menu
		# end
	end

	describe "#take_order" do
		it "gets the order" do
			#code
		end

		it "gets the input" do
			expect( gets.chomp ).to eq ""
		end

		it "process the order" do
			expect( order_processor ).to receive( :process ).with order
			order_processor.process order
		end
	end
	
end


	# describe "#get_menu" do
	# 	it "requests the menu" do
	# 		expect( order_handler ).to receive :show_menu
	# 		customer.get_menu
	# 	end
	# end

	# describe "#send_order" do
	# 	it "sends an order" do
	# 		expect( order_handler ).to receive :process_order
	# 		customer.send_order "an_order"
	# 	end
	# end