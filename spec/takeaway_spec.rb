require 'takeaway'

describe Takeaway do
  let(:takeaway) { described_class.new(menu_class) }
  let(:menu_class) { double(:menu_class, new: menu) }
  let(:menu) { double(:menu, show_menu: {'item1' => 1}) }
  let(:menu_items) { {'item1' => 1} }
  let(:item) { 'item1' }
  let(:quantity) { 5 }
  let(:single_confirmation) { "1 #{item}(s) added to your order" }
  let(:multi_confirmation) { "#{quantity} #{item}(s) added to your order" }
  let(:basket) { "5 x item1 = £5.0" }
  let(:order) { "#{quantity} x #{item} = £5.0" }
  let(:total) { "Order total: £5.0" }

  describe '#menu' do
    it 'shows a list of dishes with prices' do
      expect(takeaway.menu).to eq menu_items
    end
  end

  describe '#basket' do
    it 'adds items to the basket' do
      takeaway.order(item, quantity)
      expect(takeaway.basket).to eq basket
    end
  end

  describe '#order' do
    it 'confirms an item is added to basket' do
      expect(takeaway.order(item)).to eq single_confirmation
    end

    it 'allows multiple quantities to be added' do
      expect(takeaway.order(item, quantity)).to eq multi_confirmation
    end

    it 'raises an error if item is not on menu' do
      message = 'Item is not on menu'
      expect{takeaway.order('invalid')}.to raise_error message
    end
  end

  describe '#total' do
    it 'shows the total cost of the order' do
      takeaway.order(item, quantity)
      expect(takeaway.total).to eq total
    end
  end

  describe '#total_to_pay' do
    it 'shows the total cost as a float' do
      takeaway.order(item, quantity)
      expect(takeaway.total_to_pay).to eq 5.0
    end
  end

end
