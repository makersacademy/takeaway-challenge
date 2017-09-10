require 'menu'

RSpec.describe Menu do
  subject(:menu) { described_class.new }
  
  describe '#show' do
    it 'displays the menu' do
      expect(subject.show).to eq "Welcome to the Catnip emporium:\nThis is our menu"
    end
  end

  context 'adding items' do
    it 'displays the list of items' do
      item_array = [['item 1', 5], ['item 2', 10], ['item 3', 15]]
      menu = Menu.new(item_array)
      expect(menu.items).to eq item_array
    end
  end
end
