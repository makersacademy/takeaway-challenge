require_relative '../lib/restaurant'
require_relative '../lib/menu'
require_relative '../lib/order'

describe Restaurant do
  subject(:restaurant) { described_class.new }
  before(:each) do
    restaurant.menu.add :Pizza, 6.00
    restaurant.menu.add :Burger, 7.00
  end
  it 'shows menu' do
    expect(restaurant.read_menu).to include Burger: 7.00
  end

  it 'select number of available dishes' do
    expect(restaurant.order pizza).to be_instance_of Order
  end
end
