require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { double :menu, check_menu: item , price: 10 }
  let(:item) { double :dish }

  describe '.view_menu' do
    it 'returns the menu' do
      expect(takeaway.view_menu).to eq menu
    end
  end

  describe '.add_to_order' do
    it 'adds a menu item to the order' do
      takeaway.add_to_order(item)
      expect(takeaway.basket).to include item
    end
    it 'adds multiple items to the order' do
      takeaway.add_to_order(item, 4)
      expect(takeaway.basket).to eq({ item => 4 })
    end
    it 'collects items of the same type' do
      2.times {takeaway.add_to_order(item)}
      expect(takeaway.basket).to eq({ item => 2 })
    end
  end

  describe '.calculate_total' do
    it 'returns zero when there is nothing in the basket' do
      expect(takeaway.calculate_total).to eq 0
    end
    it 'returns the sum of the items in the basket' do
      takeaway.add_to_order(item, 2)
      expect(takeaway.calculate_total).to eq 20
    end
  end


end
