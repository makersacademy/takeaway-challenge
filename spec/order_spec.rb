require 'order'
require 'menu'

describe Order do

subject(:order) { described_class.new(menu) }
let(:dishes) { {chicken: 3} }
let(:menu) { double(:menu) }


it 'allows to select some number of dishes from the menu' do
  allow(menu).to receive(:has_dish?).and_return(true)
  order.add(:chicken ,3)
  expect(order.dishes).to eq(dishes)
end

it 'raises an error message when the chosen dish is not available from the menu' do
  allow(menu).to receive(:has_dish?).and_return(false)
  expect { order.add(:banana,4) }.to raise_error "Banana is not on the menu"
end

it 'calculates the total of the order' do
  allow(menu).to receive(:has_dish?).and_return(true)
  allow(menu).to receive(:price).with(:chicken).and_return(3.50)
  order.add(:chicken, 3)
  total = 10.50
  expect(order.total).to eq(total)

end



end
