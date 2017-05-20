require 'menu'

describe Menu do

  subject(:menu) { described_class.new }
  let(:dish) { double(:dish) }

  it 'has a list available of items available on the menu' do
    menu.items << dish
    expect(menu.items).to include(dish)
  end
end
