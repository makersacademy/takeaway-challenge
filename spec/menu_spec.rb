require 'menu'
require 'dish'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dish_class) { double(:dish_class, new: dish) }
  let(:dish) {double(:dish, name: "Chow Mein", price: '5')}

  it 'should has an empty of dishes at the start' do
    expect(menu.menu).to eq []
  end

  describe '#show_menu' do
    it 'loads the csv file and display the menu as a string' do
      menu.show_menu
      expect(menu.menu[0].name).to eq "chow mein"
    end
  end
end
