require 'restaurant'

describe Restaurant do

subject(:restaurant) { described_class.new(menu) }
let(:menu) { double(:menu, print_menu: "rice: £1")}

  it 'has a menu containing dishes and price' do
    expect(restaurant.show_menu).to eq "rice: £1"
  end



end
