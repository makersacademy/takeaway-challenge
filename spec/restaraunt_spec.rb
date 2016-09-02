require 'restaraunt'
require 'order'

describe Restaraunt do
  subject {described_class.new}

  it 'shows the menu when user runs check_menu' do
    expect(subject.check_menu).to eq Menu::MENU
  end

  context '#select_items' do

    it 'allows arguments to be passed in' do
      expect{subject.select_dishes([['jam', 6],['ham',4]],50)}.not_to raise_error
    end

    xit 'raises an error if selection is not in menu' do

      expect{subject.select_items}.to raise_error "item not in menu, select again"
    end
  end
end
