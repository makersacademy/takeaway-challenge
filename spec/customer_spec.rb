require 'customer'

describe 'customer' do

  let(:text)              { double("text") }
  let(:menu)              { double("menu") }
  let(:customer)          { Customer.new }
  #let(:send_text)         { double(:mock_send_text) }


  it 'adds a dish to order' do
    customer.add_dish("French Fries")
    expect(customer.order).to eq([{"French Fries"=>2.0}])
  end

  # described_new_class = Customer.new

  it 'adds dishes to order and displays order' do
    2.times { customer.add_dish("French Fries") }
    expect { customer.display_order }.to output("French Fries - £2.00\nFrench Fries - £2.00\nTotal cost: £4.00\nYou have ordered 2 items\n").to_stdout
  end

   it 'should complete an order' do
     text = double('text')
     allow(text).to receive(:send_text).and_return("thanks")
     expect(customer.complete_order).to eq("thanks")
   end

   it 'should display the menu' do
     menu = double('menu')
     allow(menu).to receive(:print_menu).and_return("bangers and mash")
     expect(customer.display_menu).to eq({"Beef Burger"=>7.0, "Ham Burger"=>8.5,
       "Cheese Burger"=>9.25, "French Fries"=>2.0, "Onion Rings"=>3.4})
   end


end
