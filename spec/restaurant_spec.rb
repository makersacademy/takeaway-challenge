require 'restaurant'

describe Restaurant do

  let (:customer) {double :customer}
  let (:menu) { double :menu }

  it 'receives the choice of dishes' do
    restaurant = Restaurant.new(menu)
    restaurant.receive_order(["Lobster", "Truffle"])
    expect(restaurant.dishes).to eq(["Lobster", "Truffle"])
  end

  it 'calculates the amount of dishes' do

  end


 xit 'checks order is valid' do
    customer = Customer.new("name")
    customer.view_menu(restaurant)
    expect{customer.choose_dishes("Pizza")}.to raise_error "Not on the menu"
  end
end