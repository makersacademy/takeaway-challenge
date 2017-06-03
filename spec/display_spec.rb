require './lib/display'
require './lib/menu.rb'

describe Display do
  subject(:display) { described_class.new }

  describe '#read_input' do
    it 'gives standard input' do
      fake_display = double(:display)
      allow(fake_display).to receive(:read_input)
      expect(fake_display.read_input).to eq fake_display.read_input
    end
  end

  describe '#display_menu' do
    it 'lists all menu dishes with prices' do
      expect { display.display_menu }.to output(/Starters: 1. Olives = £4, 2. Pitta bread = £5 Main Courses: 3. Fried duck = £12, 4. Fish & Chips = £9 Desserts: 5. Jam roll = £5, 6. Apple crumble = £6/).to_stdout
    end
  end

  describe '#print_interactive_menu' do
    it 'displays a menu for customer orders' do
      expect { display.print_interactive_menu }.to output(/1. Place orders\n2. Show order selections\n7. Exit\n/).to_stdout
    end
  end

  describe '#print_error_message' do
    it 'prints an error message' do
      expect { display.print_error_message }.to output(/I don't know what you mean, try again/).to_stdout
    end
  end

  describe '#print_no_orders' do
    it 'prints no orders' do
      expect { display.print_no_orders }.to output(/You have made no orders!/).to_stdout
    end
  end

  describe '#print_order(basket)' do
    it 'prints one order' do
      expect { display.print_order([2]) }.to output(/You have 1 order: order number 2/).to_stdout
    end
  end

  describe '#print_orders(basket)' do
    it 'prints one order' do
      expect { display.print_orders([2, 3, 4]) }.to output(/You have 3 orders: order numbers 2, 3, 4/).to_stdout
    end
  end

  describe '#print_total(prices, total)' do
    it 'prints total' do
      prices = "£4, £5, £12"
      total = 21
      expect { display.print_total(prices, total) }.to output(/Thanks for ordering! Your combined orders total: £4, £5, £12 which gives a total of £21/).to_stdout
    end
  end

end
