require 'menu'
require 'dish'
require 'text'

describe Menu do
	let(:dish1) {double("chicken", :name => "chicken", :price => 1.99)}
	let(:dish2) {double("wings", :name => "wings", :price => 2.99)}

	context 'a menu with multiple dishes already added' do
		before (:each) do
			subject.add_dish(dish1)
			subject.add_dish(dish2)
		end

		it 'should be able to add dishes to menu' do
			expect(subject.available_dishes).to include(dish1)
		end

		it 'should be able to store multiple dishes' do
			expect(subject.available_dishes).to include(dish1, dish2)
		end

		it 'should return the name and price of multiple dishes' do
			expect{subject.show_menu}.to output("1.#{dish1.name} - #{dish1.price}\n2.#{dish2.name} - #{dish2.price}\n").to_stdout
		end
	end
	it 'should return the name and price of a dish' do
		subject.add_dish(dish1)
		expect{subject.show_menu}.to output("1.#{dish1.name} - #{dish1.price}\n").to_stdout
	end

	describe '#get_selection' do

		before (:each) do
			allow(subject).to receive(:gets).and_return("1\n", "2\n", "done\n")
		end

		it 'should ask the user for their choice' do
			expect{subject.get_selection}.to output("Please enter the number of the item you wish to order, enter ""done"" when finished.""\n").to_stdout
		end

		it 'should add multiple dishes to cart' do
			subject.add_dish(dish1)
			subject.add_dish(dish2)
			subject.get_selection

			expect(subject.cart).to include(dish1, dish2)
		end
		
	end

	# Every test below here is broken - running the test sends a text.
	describe '#checkout' do
		before (:each) do
			allow(subject).to receive(:gets).and_return("1\n", "2\n", "done\n")
		end
		it 'should total up items in the cart' do
			subject.add_dish(dish1)
			subject.add_dish(dish2)
			subject.get_selection

			expect{subject.checkout}.to output("Your order comes to a total of £#{dish1.price + dish2.price}""\n").to_stdout
		end

		it 'send a text message' do
			text = Text.new
			total = dish1.price + dish2.price
			message = "Thank you for your order: £#{total}"
			expect(text).to receive(:send_message) {:total}
			subject.add_dish(dish1)
			subject.add_dish(dish2)
			subject.get_selection

			expect(subject.checkout).to eq(message)
		end
	end
end