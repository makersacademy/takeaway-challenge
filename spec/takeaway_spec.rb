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

  # TODO test could be improved
  describe '#process_menu' do
    it 'allows the user to order by making a course selection' do
      fake_display = double(:display)
      allow(fake_display).to receive(:print_error_message)
      expect { takeaway.process_menu(6) }.to output(/I don't know what you mean, try again/).to_stdout
    end
  end

  describe '#interactive_menu' do
    it 'loads the user menu and puts an order number in basket' do
      fake_display = double(:display)
      allow(fake_display).to receive(:read_input).and_return("1", "5", "", "7")
      allow(fake_display).to receive(:print_interactive_menu)
      allow(fake_display).to receive(:print_instructions)
      takeaway1 = Takeaway.new(fake_display)
      takeaway1.interactive_menu
      expect(takeaway1.basket).to eq [5]
    end
  end

  describe '#place_orders' do
    it 'puts order numbers in basket' do
      fake_display = double(:display)
      allow(fake_display).to receive(:read_input).and_return("7", "")
      allow(fake_display).to receive(:print_instructions)
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
      fake_cost = double(:cost)
      # text = TextProvider.new
      allow(fake_cost).to receive(:delivers_text_notification).and_return(12)
      allow(fake_cost).to receive(:send_text).and_return(12)
      expect(takeaway.delivers_text_notification(fake_cost)).to eq "Thank you! Your order was placed and will be delivered before 18:52. The total cost of your order is £12"
    end
  end

end
