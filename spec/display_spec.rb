require './lib/display'
require './lib/menu.rb'

# TODO update with more tests

describe Display do
  subject(:display) { described_class.new }
  
  describe '#read_input' do
    it 'gives standard input' do
      fake_display = double(:display)
      allow(fake_display).to receive(:read_input)
      expect(fake_display.read_input).to eq fake_display.read_input
    end
  end

  describe '#displays_menu' do
    it 'lists all menu dishes with prices' do
      expect { display.displays_menu(Menu.new) }.to output(/Starters: 1. Olives = £4, 2. Pitta bread = £5 Main Courses: 3. Fried duck = £12, 4. Fish & Chips = £9 Desserts: 5. Jam roll = £5, 6. Apple crumble = £6/).to_stdout
    end
  end

  describe '#print_interactive_menu' do
    it 'displays a menu for customer orders' do
      expect { display.print_interactive_menu }.to output(/1. Place orders\n2. Show order selections\n7. Exit\n/).to_stdout
    end
  end

end
