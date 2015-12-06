require 'order'
describe Order do
subject(:order) { described_class.new }
let(:dishes) { {chicken: 2, fish: 1} }

it 'selects several dishes from the menu' do
order.add(chicken, 2)
order.add(fish, 1)
expect(order.dishes).to eq(dishes)
end

end
