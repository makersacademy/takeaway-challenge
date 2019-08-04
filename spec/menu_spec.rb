require 'menu'

describe Menu do
  let(:item_double) { double(:item, name: "food", price: 1, add_to_order: true, quantity: 1) }
  let(:item_class_double) { double(:item_class, new: item_double) }
  let(:menu) { described_class.new(item_class_double) }
  
  before(:each) do
    menu.start
  end

  describe '#start' do
    it 'populates menu' do
      expect(menu.print_menu).to eq "Menu: food: £1.00, food: £1.00, food: £1.00, food: £1.00, food: £1.00, food: £1.00."
    end
  end

  describe '#select' do
    it 'confirms order' do
      expect(menu.select("food", 1)).to eq "1 food added to order"
    end
  end

  describe '#print_current_order' do
    # Mocking on this results in repeats
    it 'shows all selections' do
      expect(menu.print_current_order).to eq "food: 1, food: 1, food: 1, food: 1, food: 1, food: 1."
    end
  end

  describe '#order_price' do
    it 'returns the correct total' do
      expect(menu.order_price).to eq 6
    end
  end
end
