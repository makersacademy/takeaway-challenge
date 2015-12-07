require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:menu) {double :menu, dish_list: {pizza: 5, chicken: 3}}

  it 'must allow you to select dishes to order' do
    expect(order.add_dish(menu, :chicken, 3)).to eq "You have ordered 3 chicken"
  end

  it 'must confirm order if item on menu ordered' do
    expect(order.add_dish(menu, :chicken, 2)).to eq "You have ordered 2 chicken"
  end

  it 'must fail if item ordered is not on the menu' do
    expect{order.add_dish(menu, :pork, 2)}.to raise_error("Error you must select an item on the menu")
  end

  it 'must check that the total given is correct' do
    order.add_dish(menu, :chicken, 2)
    order.add_dish(menu, :pizza, 2)
    #order.current_order = [chicken: 2, pizza: 3]
    expect(order.current_total).to be 16
  end


end
