require 'restaurant'

describe Restaurant do
  order = {beer: 1, curry: 1}
  total_price = 20

context 'fail to complete order' do
  order_input = {beer: 2, curry: 1}
  price_input = total_price - 1
  subject(:restaurant) { described_class.new(order, total_price, order_input, price_input)}

  it 'processes order' do
    expect(restaurant).to respond_to(:process)
  end

  it 'raises an error if order input or price input mismatches system info' do
    expect{restaurant.process}.to raise_error("Fail to process due to unmatched price or order")
  end

end

end
