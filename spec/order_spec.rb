require 'order.rb'
describe Order do
  subject(:order) {described_class.new}

it 'adds dishes to order' do
    order.add(:Margherita, 2)
    order.add(:Pepperoni, 1)
    expect(order.dishes_ord.length).to eq(2)
  end


end
