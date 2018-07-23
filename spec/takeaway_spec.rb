require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { double(:menu, print_menu: "printed", items: { "thing1" => 4.50} ) }
  let(:sms) { double(:sms) }
	let(:send_sms) { double(:send_sms) }

  context 'menu' do
    
    it 'interacts with menu' do
      expect(takeaway.view_menu).to eq menu.print_menu
    end
	end

	context 'order functionality' do

		it 'allows user to select available items only' do
			expect{takeaway.add_to_order("sandwich")}.to raise_error "Sorry, we don't sell that!"
		end

		it 'adds one item at a time if quantity argument is not given' do
			expect{takeaway.add_to_order("thing1")}.to change {takeaway.order.basket.count}.by(1)
		end

		it 'can add multiple items at once' do
			expect{takeaway.add_to_order("thing1", 5)}.to change {takeaway.order.basket.count}.by(5)
		end

		it 'adds the price of each item to the order total' do
			expect{takeaway.add_to_order("thing1")}.to change {takeaway.order.total}.by(4.50)
		end

		it 'shows the basket total' do
			takeaway.add_to_order("thing1")
			expect(takeaway.add_to_order("thing1")).to eq "Your current order total is £9.00"
		end
	end

	context 'review order' do

		it 'shows all items in basket' do
			takeaway.add_to_order("thing1")
			expect(takeaway.check_order).to include("thing1")
		end
	end

	context 'place order' do
    
    before (:each) do
			allow(takeaway).to receive(:send_sms).and_return(true)
		end

		it 'sends an SMS' do
		  expect(takeaway.send_sms).to eq(true)
    end
	end
end
