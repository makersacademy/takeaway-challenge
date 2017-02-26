require 'restaurant'

describe Restaurant do
  subject(:restaurant) {described_class.new}

  it 'can display a menu' do
    expect(restaurant).to respond_to(:display_menu)
  end

  it 'can create a new order' do
    expect(restaurant).to respond_to(:create_order)
  end
end
