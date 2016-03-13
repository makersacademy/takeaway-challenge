require 'byebug'
require 'menu'

describe Menu do

  subject(:menu) { described_class.new }
  let(:dish) { double(:dish) }

  context 'when building a menu' do
    it 'adds an item to the menu' do
      menu.add_item('Chicken', 12)
      expect( menu.show ).to include Chicken: 12
    end
  end
  # context 'when builds a menu of available items' do
  #   it 'builds the current menu' do
  #     menu.add_item("Chicken curry", 12, true)    # I really want to test the content of the array, not just that an array gets built.
  #     expect(menu.build_menu.length).to eq 1
  #   end
  # end
  # context 'when it builds today\'s menu' do
  #   it 'display the item name and price as a string' do
  #     menu.add_item("Chicken curry", 12, true)
  #     menu.add_item("Massman curry", 12, true)
  #     menu.build_menu
  #     expect(menu.todays_menu).to be_a String
  #   end
  # end
end

# NEED HELP AND RESEARCH ON
# how to properly specify and use doubles... here add_item in creating a real dish instance. should this be a double?
