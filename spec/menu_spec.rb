require 'menu'
require 'order'

describe Menu do
  subject(:menu) { described_class.new(1) }

  it 'allows the customer to read the menu' do
    expect(menu).to respond_to(:show)
  #it { is_expected.to respond_to Dishes :show}
  end

  it 'allows the customer to select their dishes' do
    expect(menu).to respond_to(:choose)
  end
end

describe Order do
  subject(:order) {described_class.new }

  it 'present\s the customers order to them with total' do
    expect(order).to respond_to(:calculate)
  end
end
