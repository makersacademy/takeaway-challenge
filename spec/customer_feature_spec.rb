require 'customer'
require 'restaurant'

feature 'Customer wants to see' do

  let (:customer) { Customer.new }
  let (:restaurant)  { double(:restaurant) }

  before(:example) do
    allow(restaurant).to receive(:dishes).and_return( {
      :Rice => 1.50,
      :Naan => 2.00
      } )
  end

  scenario 'a list of all dish names' do
    test = customer.see_all_dishes(restaurant)
    expect(test).to eq restaurant.dishes
  end

  scenario 'a list of all items ordered and their price' do
    customer.select("Rice", 1, restaurant)
    customer.select("Naan", 1, restaurant)
    expect(customer.current_order).to eq 'Total, 2 items at £3.50'
  end

  scenario 'if they have ordered anything yet' do
    expect(customer.current_order).to eq 'Nothing ordered yet'
  end

end

feature 'Customer wants to select' do

  let (:customer) { Customer.new }
  let (:restaurant) { Restaurant.new }

  scenario 'one dish' do
    customer.select("Rice", 1, restaurant)
    expect(customer.order).to eql [["Rice", 1.50]]
  end

  scenario 'a dish that is not available' do
    expect { customer.select("Pizza", restaurant) }.to raise_error
  end

  scenario 'two dishes' do
    customer.select("Rice", 1, restaurant)
    customer.select("Naan", 1, restaurant)
    expect(customer.order).to eql [["Rice", 1.50],["Naan", 2.00]]
  end

  scenario 'two of the same type of dish' do
    customer.select("Rice", 2, restaurant)
    expect(customer.order).to eql [["Rice", 1.50],["Rice", 1.50]]
  end

end

feature 'Customer wants to finalise order' do

  let (:customer) { Customer.new }
  let (:restaurant) { Restaurant.new }

  scenario 'but has not ordered anything' do
    expect { place_order(customer) }.to raise_error
  end

  xscenario 'and receive a confirmation text' do
    customer.select("Rice", 1, restaurant)
    customer.select("Naan", 1, restaurant)
    customer.select("Vindaloo", 1, restaurant)
    expect(restaurant.place_order(customer)).to eq 'Order confirmed'
  end


end