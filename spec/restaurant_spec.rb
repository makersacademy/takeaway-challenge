require 'restaurant'

describe Restaurant do
  subject(:takeaway) { described_class.new }

  describe 'Class access:' do
    it 'creates a new instance of a menu on initialize' do
      expect(takeaway.menu).to be_an_instance_of(Menu)
    end
  end


  describe 'Display requests:' do
    it 'responds to a request to display a restaurant menu' do
      expect(takeaway).to respond_to(:display_menu)
    end
    it 'prints the menu items and prices of the instanced menu' do
      expect(takeaway.display_menu).to include("juice")
    end
  end

  describe 'Ordering mechanics:' do
    it 'responds to request to add an item into an order' do
      expect(takeaway).to respond_to(:order).with(2).arguments
    end
    it 'stores quantity and item ordered when #order is called' do
      takeaway.order("rat soup", 2)
      takeaway.order("bread", 3)
      expect(takeaway.current_order.items[0]).to include("rat soup")
      expect(takeaway.current_order.items[1]).to include("bread")
    end
  end
end
