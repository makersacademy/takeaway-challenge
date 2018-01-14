require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:menu) { double :menu }
  let(:menu_printer) { double :menu_printer }
  let(:dish1) { double :dish1, price: 3 }
  let(:order_printer) { double :order_printer, print: nil }
  let(:order) { double :order, kind_of?: true }
  let(:dish_list_printer) { double :dish_list_printer }
  let(:shopping_cart) { double :shopping_cart, empty: nil, items: [dish1], kind_of?: true }

  before(:each) do
    allow(menu).to receive(:add).and_return menu
    allow(DishListPrinter).to receive(:new).and_return dish_list_printer
    allow(Menu).to receive(:new).and_return menu
    allow(MenuPrinter).to receive(:new).and_return menu_printer
    allow(Order).to receive(:new).and_return order
    allow(OrderPrinter).to receive(:new).and_return order_printer
    allow(ShoppingCart).to receive(:new).and_return shopping_cart
  end

  context '#initialize' do
    it 'has a menu' do
      expect(takeaway.menu).to eq menu
    end

    it 'has a menu containing 10 items' do
      expect(menu).to receive(:add).with(an_instance_of(Dish)).exactly(10).times
      Takeaway.new
    end

    it 'creates a menu printer' do
      expect(MenuPrinter).to receive(:new).with(dish_list_printer).and_return(menu_printer)
      Takeaway.new
    end

    it 'creates an order printer' do
      expect(OrderPrinter).to receive(:new).with(dish_list_printer).and_return(order_printer)
      Takeaway.new
    end

    it 'has a shopping cart' do
      expect(takeaway.shopping_cart).to be_a ShoppingCart
    end
  end

  context '#display_menu' do
    it 'prints a menu out' do
      expect(menu_printer).to receive(:print).with(menu)
      Takeaway.new.display_menu
    end
  end

  context '#add_to_cart' do
    it 'adds an item to the cart' do
      expect(takeaway.shopping_cart).to receive(:add)
      takeaway.add_to_cart(dish1)
    end
  end

  context '#remove_from_cart' do
    it 'removes an item from the cart' do
      expect(takeaway.shopping_cart).to receive(:remove)
      takeaway.remove_from_cart(dish1)
    end
  end

  context '#checkout' do
    it 'empties shopping cart' do
      expect(takeaway.shopping_cart).to receive(:empty)
      Takeaway.new.checkout
    end

    it 'returns an order' do
      expect(takeaway.checkout).to be_a Order
    end

    it 'prints the order' do
      expect(order_printer).to receive(:print).with(order)
      Takeaway.new.checkout
    end
  end
end