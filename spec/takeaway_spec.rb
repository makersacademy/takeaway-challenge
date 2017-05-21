require './lib/takeaway.rb'
require './lib/menu.rb'

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
      expect { takeaway.print_menu }.to output(/5. Exit/).to_stdout
    end
  end

  # TODO this is a cheat test - consider changing this so I check not just the final line but the entire process
  describe '#process_menu' do
    it 'allows the user to order by making a course selection' do
      expect { takeaway.process_menu(6) }.to output(/I don't know what you mean, try again/).to_stdout
    end
  end

end
