require 'menu'

RSpec.describe Menu do
  let(:test_menu) { Menu.new }
  let(:item_1) { double(:pizza, name: :pepperoni_pizza, price: 8) }
  let(:item_2) { double(:pizza, name: :margherita_pizza, price: 6) }
  let(:listing_1) { double(:listing, dish: item_1, servings_left: 2) }
  let(:listing_2) { double(:listing, dish: item_2, servings_left: 1) }

  describe 'example menu' do
    before(:each) do
      test_menu.add_dishes(listing_1, listing_2)
    end

    it 'has pepperoni pizza as its first item' do
      expect(test_menu.item(1)).to eq item_1
    end

    it 'has margherita pizza as its second item' do
      expect(test_menu.item(2)).to eq item_2
    end
  end
end
