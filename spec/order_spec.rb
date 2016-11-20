require 'order'

describe Order do

  subject(:order) {described_class.new}

  it "shows menu options from Menu class" do
    expect(order.see_options).to eq({:pizza => 2.99, :thai => 4.55, :mexican => 5.25})
  end

  it 'allows the user to select pizza' do
    expect(order.select_pizza).to eq({:pizza=>2.99})
  end

  it 'puts selections in new order list' do
    expect(order.select_pizza).to change{order.new_order}
  end

  it 'adds the total of meals in their order' do
    order.select_thai
    order.select_pizza
    expect(order.order_total).to eq(7.54)
  end

end
