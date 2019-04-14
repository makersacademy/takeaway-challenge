require 'order'
describe Order do
  subject(:order) { Order.new }

  let(:basket) do
    {tacos: 1, burrito: 2}
  end

 it 'adds meals to basket from the menu' do
   order.add(:tacos, 1)
   order.add(:burrito, 2)
  expect(order.basket).to eq basket
 end
end
