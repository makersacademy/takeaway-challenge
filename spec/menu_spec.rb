require 'menu'

RSpec.describe Menu do
  let(:test_menu) { Menu.new }
  let(:item_1) { double(:pizza, name: :pepperoni_pizza, price: 8) }
  let(:item_2) { double(:pizza, name: :margherita_pizza, price: 6) }

  describe 'item listing' do
    before(:each) do
      test_menu.add_dishes(item_1, item_2)
    end

    it 'has pepperoni pizza as its first item' do
      expect(test_menu.menu_item(1)).to eq item_1
    end

    it 'has margherita pizza as its second item' do
      expect(test_menu.menu_item(2)).to eq item_2
    end
  end
end
