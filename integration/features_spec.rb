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
    expect(restaurant.menu.display).to include Burger: 7.00
  end
end
