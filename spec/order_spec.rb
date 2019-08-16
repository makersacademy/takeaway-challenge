require 'order'

describe Order do
  let(:dish) { double(:dish) }
  let(:menu) { double(:menu, dish_from_name: dish) }
  subject(:subject) { described_class.new(menu, "Foo soup", 2) }
  it 'can retrieve the required quantity of dishes from its name' do
    expect(subject.order).to eq([dish, dish])
  end
  it 'returns nothing if order is not valid' do
    invalid_order = Order.new(menu, 'Foobar jambalaya', 1)
    allow(menu).to receive(:dish_from_name).and_return(nil)
    expect(subject.order).to be_empty
  end
end
