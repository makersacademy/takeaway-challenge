require 'order'

describe Order do

  subject(:order) { described_class.new }

  it 'allows a customer to select an item' do
    order.add_item("Golden French Fries")
    expect(order.items).to include ( {"Golden French Fries" => 1})
  end
end
