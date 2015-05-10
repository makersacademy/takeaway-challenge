require 'restaurant'

describe Restaurant do

  let(:customer) { double :customer }
  let(:menu) { double :menu }
  let(:restaurant) { Restaurant.new(menu) }

  before :each do
    allow(menu).to receive(:dishes)
  end

  it 'receives the choice of dishes' do
    restaurant.menu = { "Lobster" => 30.00, "Truffle" => 40.00 }
    expect(restaurant.receive_order(["Lobster", "Truffle"])).to eq(["Lobster", "Truffle"])
  end

  it 'calculates the amount of dishes' do
    restaurant.menu = { "Lobster" => 30.00, "Truffle" => 30.00 }
    restaurant.receive_order(["Lobster", "Truffle"])
    restaurant.calculate_order([4, 2])
    expect(restaurant.order).to eq(["Lobster", "Lobster", "Lobster", "Lobster", "Truffle", "Truffle"])
  end

  it 'calculates the final price' do
    restaurant.menu = { "Lobster" => 30.00, "Truffle" => 40.00 }
    restaurant.receive_order(["Lobster", "Truffle"])
    restaurant.calculate_order([2, 2])
    expect(restaurant.order_review).to eq([["Lobster", 30.00], ["Lobster", 30.00], ["Truffle", 40.00], ["Truffle", 40.00], ["Grand Total", 140.00]])
  end

  it 'checks order is valid' do
    restaurant.menu = { "Lobster" => 30.00, "Truffle" => 40.00 }
    expect { restaurant.receive_order(["Pizza"]) }.to raise_error "Not on the menu"
  end
end