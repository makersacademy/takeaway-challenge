require 'customer'

describe 'customer' do

  described_class = Customer.new

  it 'adds a dish to order' do
    described_class.add_dish("French Fries")
    expect(described_class.order).to eq([{"French Fries"=>2.0}])
  end

  described_new_class = Customer.new

  it 'adds dishes to order and displays order' do
    2.times { described_new_class.add_dish("French Fries") }
    expect { described_new_class.display_order }.to output("French Fries - £2.00\nFrench Fries - £2.00\nTotal cost: £4.00\nYou have ordered 2 items\n").to_stdout
  end

end
