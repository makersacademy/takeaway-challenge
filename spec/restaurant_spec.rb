require 'restaurant'

describe Restaurant do

  let (:customer) { double :customer }
  let (:menu) { double :menu }
  let (:restaurant) { Restaurant.new(menu) }

  before :each do
    allow(menu).to receive(:dishes)
  end

  it 'receives the choice of dishes' do
    restaurant.menu = {"Lobster" => 30.00, "Truffle" => 40.00}
    restaurant.receive_order(["Lobster", "Truffle"])
    expect(restaurant.choice).to eq({ "Lobster" => 30.00, "Truffle" => 40.00 })
  end

  it 'calculates the amount of dishes' do
    restaurant.menu = {"Lobster" => 30.00, "Truffle" => 40.00}
    restaurant.receive_order(["Lobster", "Truffle"])
    restaurant.calculate_order([4, 2])
    expect(restaurant.order).to eq(["Lobster","Lobster","Lobster","Lobster","Truffle", "Truffle"])
  end


 xit 'checks order is valid' do
    customer = Customer.new("name")
    customer.view_menu(restaurant)
    expect{customer.choose_dishes("Pizza")}.to raise_error "Not on the menu"
  end
end