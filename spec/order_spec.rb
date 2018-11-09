require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:menu) { double() }

  it 'allows select dishes and quantities' do
    order.select_dish("Chicken Curry", 2)
    expect(order.dishes).to include({:name => "Chicken Curry", :quantity => 2})
  end

end
