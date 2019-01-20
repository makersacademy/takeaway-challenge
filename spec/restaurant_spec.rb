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
      expect(takeaway.display_menu).not_to be_empty
    end
    it 'prints a total balance statement when requested' do
      expect(takeaway.print_total).to include("You owe")
    end
  end

  describe 'Ordering mechanics:' do
    it 'responds to request to add an item into an order' do
      expect(takeaway).to respond_to(:order).with(2).arguments
    end

    it 'stores quantity and item ordered when #order is called' do
      takeaway.order("rat soup", 2)
      takeaway.order("moldy bread", 3)
      expect(takeaway.current_order.items).to include("rat soup")
      expect(takeaway.current_order.items).to include("moldy bread")
    end

    it 'can report the total value of the present order' do
      takeaway.order("rat soup")
      takeaway.order("mystery meat pie")
      expect(takeaway.get_total).to eq(9)
    end

    it 'fails neatly if order item is mistyped from what is on menu' do
        expect { takeaway.order("") }.to raise_error('Item not on menu!')
    end
  end

  describe 'Completing order:' do
    it 'responds to #complete_order method' do
      expect(takeaway).to respond_to(:complete_order).with(1)
    end
  end
end
