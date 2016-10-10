require 'order'

describe Order do
  subject(:order) { described_class.new }

  it 'order total to be sum of items added' do
    subject.select_dish(1)
    subject.select_dish(2)
    expect(order.confirm_order).to eq 11.32
  end
end
