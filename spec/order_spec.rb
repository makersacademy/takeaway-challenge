require 'order'

describe Order do
  let(:food) { double :food}
  let(:quantity) {double :quantity}
  it 'orders food from menu' do
    expect(subject.order_food(food, quantity)).to eq [{:food => food, :quantity => quantity}]
  end

end
