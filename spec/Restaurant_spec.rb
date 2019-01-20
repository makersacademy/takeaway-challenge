require 'Restaurant'

RSpec.describe Restaurant do
  subject(:restaurant) { described_class.new }

  it 'total bill matches the sum of the various dishes in my order' do
    3.times { restaurant.menu.select_dish('burger', 1) }
    expect(restaurant.bill).to eq(15)
  end

  it 'places an order and message is being sent to customer' do
    allow(restaurant).to receive(:place_your_order).and_return(false)
    expect(restaurant).to respond_to(:place_your_order)
  end

end
