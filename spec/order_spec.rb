require 'order.rb'
require 'menu.rb'
describe Order do
  subject(:order) {described_class.new(a_menu: menu)}
  let(:menu) {double :menu, have_dish?: true}
  let(:marg_pizza) {double(:marg_pizza, name: 'Margherita', price: 6.00)}
  let(:pepp_pizza) {double(:pepp_pizza, name: 'Pepperoni', price: 6.50)}
  let(:dishes_ord) do
    [{dish: marg_pizza, quantity: 2}, {dish: pepp_pizza, quantity: 1}]
    end
it 'adds dishes to order' do
  allow(order).to receive(:on_menu?) {true}
    order.add(marg_pizza, 2)
    order.add(pepp_pizza, 1)
    expect(order.dishes_ord.length).to eq(2)
  end

  it 'creates a sum of the prices of ordered dishes' do
    allow(order).to receive(:on_menu?) {true}
    order.add(marg_pizza, 2)
    order.add(pepp_pizza, 1)
    expect(order.total_order).to eq(18.50)
  end

  it 'raises an error if dish to add is not on the menu' do
    allow(order).to receive(:on_menu?) {false}
    expect{order.add(:pizza, 7)}.to raise_error 'Dish is not on menu!'
  end

  it 'verifies order total against the sum of dish prices' do
      expect(order.correct_price?(18.50, dishes_ord)).to eq true
    end



end
