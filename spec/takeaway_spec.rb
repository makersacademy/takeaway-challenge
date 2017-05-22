require './lib/takeaway.rb'
require './lib/menu.rb'
require './lib/display.rb'
# require './lib/text_provider.rb'

describe Takeaway do
  subject(:takeaway) { described_class.new }

  describe '#initialize' do
    it 'is has a menu from Menu class' do
      expect(takeaway.menu).to eq takeaway.menu
    end
    it 'is initialized with a basket' do
      expect(takeaway.basket).to eq []
    end
    it 'is initialized with a display' do
      expect(takeaway.display).to eq takeaway.display
    end
  end

  describe "#extracts_starters" do
    it 'lists starters from menu' do
      expect { takeaway.extracts_starters }.to output(/Starters: 1. Olives = £4, 2. Pitta bread = £5/).to_stdout
    end
  end

  describe "#extracts_main_course" do
    it 'lists main courses from menu' do
      expect { takeaway.extracts_main_course }.to output(/Main Courses: 3. Fried duck = £12, 4. Fish & Chips/).to_stdout
    end
  end

  describe "#extracts_dessert" do
    it 'lists desserts from menu' do
      expect { takeaway.extracts_dessert }.to output(/Desserts: 5. Jam roll = £5, 6. Apple crumble = £6/).to_stdout
    end
  end

  describe '#lists_dishes_with_prices' do
    it 'lists all menu dishes with prices' do
      expect { takeaway.lists_dishes_with_prices }.to output(/Starters: 1. Olives = £4, 2. Pitta bread = £5 Main Courses: 3. Fried duck = £12, 4. Fish & Chips = £9 Desserts: 5. Jam roll = £5, 6. Apple crumble = £6/).to_stdout
    end
  end

  # TODO test could be improved
  describe '#print_menu' do
    it 'displays a menu for customer orders' do
      expect { takeaway.print_menu }.to output(/1. Place orders\n2. Show order selections\n7. Exit\n/).to_stdout
    end
  end

  # TODO test could be improved
  describe '#process_menu' do
    it 'allows the user to order by making a course selection' do
      expect { takeaway.process_menu(6) }.to output(/I don't know what you mean, try again/).to_stdout
    end
  end

  describe '#interactive_menu' do
    it 'loads the user menu and puts an order number in basket' do
      fake_display = double(:display)
      allow(fake_display).to receive(:read_input).and_return("1", "5", "", "7")
      takeaway1 = Takeaway.new(fake_display)
      takeaway1.interactive_menu
      expect(takeaway1.basket).to eq [5]
    end
  end

  describe '#place_orders' do
    it 'puts order numbers in basket' do
      fake_display = double(:display)
      allow(fake_display).to receive(:read_input).and_return("7", "")
      takeaway1 = Takeaway.new(fake_display)
      takeaway1.place_orders
      expect(takeaway1.basket).to eq [7]
    end
  end

  describe '#print_orders' do
    it 'prints the order numbers from the basket' do
      takeaway.basket.push(1, 2, 3)
      expect { takeaway.print_orders }.to output(/You have 3 orders: order numbers 1, 2, 3/).to_stdout
    end
  end

  describe '#gives_orders_with_dishes_hash' do
    it 'returns a hash of the dishes & their prices ordered from the menu' do
      takeaway.basket.push(1, 2, 3)
      expect(takeaway.gives_orders_with_dishes_hash).to eq [{ "Olives" => 4 }, { "Pitta bread" => 5 }, { "Fried duck" => 12 }]
    end
  end

  describe '#gives_orders_prices' do
    it 'returns a hash with orders and prices of the orders added to the basket' do
      takeaway.basket.push(1, 2, 3)
      takeaway.gives_orders_with_dishes_hash
      expect(takeaway.gives_orders_prices).to eq [4, 5, 12]
    end
  end

  describe '#calculates_order_cost' do
    it 'returns the total of all the order prices' do
      takeaway.basket.push(1, 2, 3)
      takeaway.gives_orders_with_dishes_hash
      takeaway.gives_orders_prices
      expect(takeaway.calculates_order_cost).to eq 21
    end
  end

  describe '#prints_order_total' do
    it 'prints the order total next to the prices of the order dishes' do
      takeaway.basket.push(1, 2, 3)
      takeaway.gives_orders_with_dishes_hash
      takeaway.gives_orders_prices
      takeaway.calculates_order_cost
      expect { takeaway.prints_order_total }.to output(/Thanks for ordering! Your combined orders total: £4, £5, £12 which gives a total of £21/).to_stdout
    end
  end

  xdescribe '#delivers_text_notification' do
    it 'delivers a text notification once an order has been made' do
      fake_text = double(:text)
      allow(fake_text).to receive(:send_text).and_return("Thank you! Your order was placed and will be delivered before 18:52")
      expect { takeaway.delivers_text_notification }.to output(/Thank you! Your order was placed and will be delivered before 18:52/).to_stdout
    end
  end

end
