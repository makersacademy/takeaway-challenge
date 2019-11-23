require 'menu_listing'

RSpec.describe MenuListing do
  let(:item_1) { double(:pizza, name: :pepperoni_pizza, price: 8) }
  let(:item_2) { double(:pizza, name: :margherita_pizza, price: 6) }
  let(:test_listing_1) { MenuListing.new(item_1, 10) }
  let(:test_listing_2) { MenuListing.new(item_2, 11) }

  it 'acknowledges there are 10 servings left of item 1' do
    expect(test_listing_1.servings_left).to be 10
  end

  it 'acknowledges there are 11 servings left of item 2' do
    expect(test_listing_2.servings_left).to be 11
  end

  describe '#register_sale' do
    it 'reduces the number available by 1' do
      expect { test_listing_1.register_sale }.to change { test_listing_1.servings_left }.by -1
    end
  end
end
