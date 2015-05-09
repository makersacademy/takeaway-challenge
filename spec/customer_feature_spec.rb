require 'customer'
require 'restaurant'

feature 'Customer wants to' do

  let (:customer) { Customer.new }
  let (:restaurant) { Restaurant.new }

  scenario 'see a list of all dish names' do
    expect(customer.see_all_dishes(restaurant)).to eq restaurant.dishes
  end

  scenario 'select a dish' do
    customer.select("Rice", restaurant)
    expect(customer.order).to eql [:Rice]
  end

  scenario 'select a dish that is not available' do
    expect { customer.select("Pizza", restaurant) }.to raise_error
  end

  scenario 'select two dishes' do
    customer.select("Rice", restaurant)
    customer.select("Naan", restaurant)
    expect(customer.order).to eql [:Rice, :Naan]
  end

  scenario 'select two of the same type of dish' do
    2.times { customer.select("Rice", restaurant) }
    expect(customer.order).to eql [:Rice, :Rice]
  end

end