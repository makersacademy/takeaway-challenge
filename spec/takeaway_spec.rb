require 'takeaway'

describe Takeaway do
  let(:menu) { double :menu }

  it 'has a menu with a list of dishes and prices' do
    menu_items = [Dish.new("pie", 5), Dish.new("pizza", 6)]
    allow(menu).to receive(:items).and_return menu_items
    takeaway = Takeaway.new(menu)

    expect(takeaway.view_menu).to eq menu_items
  end

  context 'ordering menu items' do
    it 'orders an item from the menu' do
      pie = Dish.new("pie", 5)
      allow(menu).to receive(:order).and_return pie
      takeaway = Takeaway.new(menu)

      expect(takeaway.order_item("pie").item).to eq pie
    end

    it 'orders a given quantity of an item from the menu' do
      menu_items = [Dish.new("pie", 5), Dish.new("pizza", 6), Dish.new("chips", 2)]
      allow(menu).to receive(:order).and_return menu_items.first
      takeaway = Takeaway.new(menu)

      expect(takeaway.order_item("pie", 2).quantity).to eq 2
    end
  end

  context 'reviewing an order' do
    it 'shows an ordered item with quantity and cost' do
      menu_items = [Dish.new("pie", 5), Dish.new("pizza", 6), Dish.new("chips", 2)]
      allow(menu).to receive(:order).and_return menu_items.first
      takeaway = Takeaway.new(menu)
      order_item = takeaway.order_item("pie")

      expect(takeaway.review_order).to eq "1 x pie: £5"
    end

    it 'shows all ordered items with quantities and costs' do
      menu = Menu.new
      takeaway = Takeaway.new(menu)
      pie = takeaway.order_item("pie")
      pizza = takeaway.order_item("pizza")

      expect(takeaway.review_order).to eq "1 x pie: £5, 1 x pizza: £6"
    end
  end

end
