require 'order'

describe Order do

  subject(:order) { described_class.new }

  it 'add dish to @basket' do
    order.add_dish("Chicken", 1)
    expect(order.basket).to have_key("Chicken")
    expect(order.basket).to have_value(1)
  end

end
