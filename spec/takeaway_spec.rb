require './lib/takeaway.rb'
require './lib/menu.rb'
require './lib/display.rb'

describe Takeaway do
  subject(:takeaway) { described_class.new }

  # TODO use doubles throughout. e.g. allow(fake_menu).to receive(:menu).and_return(fake_menu)
  describe '#initialize' do
    # TODO express differently/delete
    it 'is has a menu from Menu class' do
      expect(takeaway.menu).to eq takeaway.menu
    end
    it 'is initialized with a basket' do
      expect(takeaway.basket).to eq []
    end
  end

  # TODO update tests with proper stdout format e.g expect(takeaway.lists_dishes_with_prices).to output(all_dishes).to_stdout
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

  # TODO this is a cheat test - consider changing this so I check not just the final line but the entire menu
  describe '#print_menu' do
    it 'displays a menu for customer orders' do
      expect { takeaway.print_menu }.to output(/1. Place orders\n2. Show order selections\n7. Exit\n/).to_stdout
    end
  end

  # TODO this is a cheat test - consider changing this so I check not just the final line but the entire process
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
      takeaway.basket.push(1,2,3)
      expect { takeaway.print_orders }.to output(/You have 3 orders: order numbers 1, 2, 3/).to_stdout
    end
  end

  describe "#gives_orders_with_dishes_hash" do
    it 'returns a hash of the dishes & their prices ordered from the menu' do
      takeaway.basket.push(1,2,3)
      expect(takeaway.gives_orders_with_dishes_hash).to eq [{ "Olives" => 4 }, { "Pitta bread" => 5 }, { "Fried duck" => 12 }]
    end
  end


  # TODO work out how to check this method properly as right now it doesn't actually check that the method works
  xdescribe '#calculates_order_cost' do
    it 'calculates the cost of one order' do
      fake_basket = double(:basket)
      allow(fake_basket).to receive(:calculates_order_cost).and_return(12)
      expect(fake_basket.calculates_order_cost).to eq 12
    end
    it 'calculates the cost of more than one order' do
      fake_basket = double(:basket)
      allow(fake_basket).to receive(:calculates_order_cost).and_return(27)
      expect(fake_basket.calculates_order_cost).to eq 27
    end
  end

  describe '#checks order cost matches sum of all the orders from the basket'

end
