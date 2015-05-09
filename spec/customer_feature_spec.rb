require 'customer'
require 'restaurant'

feature 'Customer wants to see' do

  let (:customer) { Customer.new }
  let (:restaurant) { Restaurant.new }

  scenario 'a list of all dish names' do
    expect(customer.see_all_dishes(restaurant)).to eq restaurant.dishes
  end

  scenario 'a list of all items ordered and their price' do
    customer.select("Rice", restaurant)
    customer.select("Naan", restaurant)
    expect(customer.current_order).to eq 'Total, 2 items at £3.5'
  end

  scenario 'if they have ordered anything yet' do
    expect(customer.current_order).to eq 'Nothing ordered yet'
  end

feature 'Customer want to select'

  let (:customer) { Customer.new }
  let (:restaurant) { Restaurant.new }

  scenario 'one dish' do
    customer.select("Rice", restaurant)
    expect(customer.order).to eql [["Rice", 1.50]]
  end

  scenario 'a dish that is not available' do
    expect { customer.select("Pizza", restaurant) }.to raise_error
  end

  scenario 'two dishes' do
    customer.select("Rice", restaurant)
    customer.select("Naan", restaurant)
    expect(customer.order).to eql [["Rice", 1.50],["Naan", 2.00]]
  end

  scenario 'two of the same type of dish' do
    2.times { customer.select("Rice", restaurant) }
    expect(customer.order).to eql [["Rice", 1.50],["Rice", 1.50]]
  end

end