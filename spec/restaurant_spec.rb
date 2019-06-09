require 'restaurant'

describe Restaurant do 
  subject(:restaurant) { described_class.new(menu: menu) }

  let(:menu) { double(:menu, print_menu: printed_menu) }
  let(:printed_menu) { "jollof rice: £6" } 
  
  it 'shows menu of dishes and prices' do 
    expect(restaurant.print_menu).to eq(printed_menu)
  end

  it 'adds a number of several dishes to current order' do
  end
end
