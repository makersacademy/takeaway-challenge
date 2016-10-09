require 'takeaway'

describe Takeaway do
  let(:menu) { double :menu }

  it 'has a menu with a list of dishes and prices' do
    items = [Dish.new("pie", 5), Dish.new("pizza", 6)]
    allow(menu).to receive(:items).and_return items
    takeaway = Takeaway.new(menu)

    expect(takeaway.view_menu).to eq items
  end

  context 'ordering menu items' do
    it 'orders an item from the menu' do
      items = [Dish.new("pie", 5), Dish.new("pizza", 6), Dish.new("chips", 2)]
      allow(menu).to receive(:order).and_return items.first
      takeaway = Takeaway.new(menu)

      expect(takeaway.order("pie").item).to eq items.first
    end

    it 'orders a given quantity of a specific item from the menu' do
      items = [Dish.new("pie", 5), Dish.new("pizza", 6), Dish.new("chips", 2)]
      allow(menu).to receive(:order).and_return items.first
      takeaway = Takeaway.new(menu)
      expect(takeaway.order("pie", 2).item).to eq items.first
    end
  end

  context 'reviewing an order' do

    
    # it 'shows the ordered items, quantities and cost' do
    #   items = [Dish.new("pie", 5), Dish.new("pizza", 6), Dish.new("chips", 2)]
    #   allow(menu).to receive(:order).and_return items.first
    #   takeaway = Takeaway.new(menu)
    #   takeaway.order("pie")
    #   expect(takeaway.review_order).to eq "1 x pie: £5.00"
    # end
  end

end
