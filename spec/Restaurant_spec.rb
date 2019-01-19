require 'Restaurant'

RSpec.describe Restaurant do

  subject(:restaurant) { restaurant = Restaurant.new }

  it 'total bill matches the sum of the various dishes in my order' do
    3.times{ restaurant.menu.select_dish('burger',1) }
    expect(restaurant.bill).to eq(15)
  end

end
