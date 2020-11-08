require 'restaurant'

describe Restaurant do
  let(:menu) { double :menu }
  let(:orderlist) { double :orderlist }
  let(:orderlist_class) { double :orderlist_class, new: orderlist }
  let(:menu_class) { double :menu_class, new: menu }
  let(:dummy_food) { double :food }
  let(:test_restaurant) { Restaurant.new(orderlist_class, menu_class) }

  it "initializes and creates an OrderList and a Menu" do
    expect(menu_class).to receive(:new)
    expect(orderlist_class).to receive(:new)
    test_restaurant
  end

  it "can call menu functions" do
    test_restaurant
    expect(menu).to receive(:add).with(dummy_food)
    expect(menu).to receive(:display_all)
    expect(menu).to receive(:display_drinks)
    expect(menu).to receive(:display_food)
    test_restaurant.menu.add(dummy_food)
    test_restaurant.menu.display_all
    test_restaurant.menu.display_drinks
    test_restaurant.menu.display_food
  end

  it "can call OrderList functions" do
    test_restaurant
    expect(orderlist).to receive(:new_order)
    expect(orderlist).to receive(:show_history)
    test_restaurant.orders.new_order
    test_restaurant.orders.show_history
  end
end
