require 'restaurant'

describe Restaurant do

  subject(:restaurant) { Restaurant.new(menu_dbl) }
  let(:menu_dbl) { double('menu') }

  it 'stores the given menu' do
    expect(restaurant).to have_attributes(:menu => menu_dbl)
  end
end
