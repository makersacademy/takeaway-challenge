require "menu"

describe Menu do

subject(:menu) {Menu.new}
let(:available_menu) { double(:available_menu) }

  it 'initializes the menu upon creating' do
    expect(menu.available_menu).to eq available_menu
  end
  let :available_menu do
      [
        { name: 'Burger', price: 10.95 },
        { name: 'Pizza', price: 14.00 },
        { name: 'Salad', price: 7.60 },
        { name: 'fries', price: 2.90 }
      ]
    end



end
