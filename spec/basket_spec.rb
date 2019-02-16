require 'basket'
describe Basket do
  it 'gets created with and empty list of basket items' do
    basket = Basket.new
    expect(basket.basket_items).to eq []
  end
end
