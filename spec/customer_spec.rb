require 'customer'

describe 'customer' do
  let(:text)              { double("text")  }
  let(:menu)              { double("menu")  }

  before do
    allow(menu).to receive(:dishes).and_return(  DISHES = {
        "Beef Burger" => 7.00,
        "Ham Burger" => 8.50,
        "Cheese Burger" => 9.25,
        "French Fries" => 2.00,
        "Onion Rings" => 3.40
      })
    end
  it 'adds a dish to order' do
    customer = Customer.new(menu, text)
    customer.add_dish("French Fries")
    expect(customer.order).to eq([{ "French Fries" => 2.0 }])
  end


  it 'adds dishes to order and displays order' do
    customer = Customer.new(menu, text)
    2.times { customer.add_dish("French Fries") }
    expect { customer.display_order }.to output("French Fries - £2.00\nFrench Fries - £2.00\nTotal cost: £4.00\nYou have ordered 2 items\n").to_stdout
  end

  before do
    allow(text).to receive(:send_text).and_return("thanks")
  end
  it 'should complete an order' do
    customer = Customer.new(menu, text)
    expect(customer.complete_order).to eq("thanks")
  end

  it 'should display the menu' do
    customer = Customer.new(menu, text)
    allow(menu).to receive(:print_menu).and_return("bangers and mash")
    expect(customer.display_menu).to eq("bangers and mash")
  end
end
