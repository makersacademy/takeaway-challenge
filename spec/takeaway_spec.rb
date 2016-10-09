require 'takeaway'

describe Takeaway do
  let(:menu) { double :menu }
  subject(:takeaway) { described_class.new(menu)}

  it 'has a menu with a list of dishes and prices' do
    menu_items = [Dish.new("pie", 5), Dish.new("pizza", 6)]
    allow(menu).to receive(:items).and_return menu_items

    expect(takeaway.view_menu).to eq menu_items
  end

  context 'ordering menu items' do
    let(:pie) { Dish.new("pie", 5) }
    before do
      allow(menu).to receive(:order).with("pie").and_return pie
    end

    it 'orders an item from the menu', :focus do
      expect(takeaway.order_item("pie").item).to eq pie
    end

    it 'orders a given quantity of an item from the menu' do
      expect(takeaway.order_item("pie", 2).quantity).to eq 2
    end
  end

  context 'reviewing an order' do
    before do
      pie = Dish.new("pie", 5)
      pizza = Dish.new("pizza", 6)
      chips = Dish.new("chips", 3)
      allow(menu).to receive(:order).with("pie").and_return pie
      allow(menu).to receive(:order).with("pizza").and_return pizza
      allow(menu).to receive(:order).with("chips").and_return chips
    end
    it 'shows an ordered item and the cost' do
      takeaway.order_item("pie")

      expect(takeaway.review_order).to eq "1 x pie: £5"
    end

    it 'shows all ordered items and costs' do
      takeaway.order_item("pie")
      takeaway.order_item("pizza")

      expect(takeaway.review_order).to eq "1 x pie: £5, 1 x pizza: £6"
    end

    it 'shows all ordered items with different quantities and total costs' do
      takeaway.order_item("pie")
      takeaway.order_item("pizza", 2)
      takeaway.order_item("chips", 3)

      expect(takeaway.review_order).to eq "1 x pie: £5, 2 x pizza: £12, 3 x chips: £9"
    end
  end

end
