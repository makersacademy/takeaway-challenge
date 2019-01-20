require 'Restaurant'

RSpec.describe Restaurant do
  subject(:restaurant) { described_class.new }

  it 'total bill matches the sum of the various dishes in my order' do
    3.times { restaurant.menu.select_dish('burger', 1) }
    expect(restaurant.bill).to eq(15)
  end

  it 'will raise an error if meal is not selected' do
    expect { restaurant.place_your_order }.to raise_error('Please select your meal')
  end

  it 'places an order and message is being sent to customer' do
    expect(restaurant).to respond_to(:place_your_order)
  end

end
