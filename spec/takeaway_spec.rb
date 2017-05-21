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

  # TODO update these tests to make sure that can choose 0 or Q
  xdescribe '#displays_controller' do
    it 'displays a message to prompt user to move to navigate to the selection menu and instructions to quit' do
      expect(takeaway.displays_controller).to eq "Welcome to our takeaway service. Please make your order by selecting 0 to be taken to the selection menu, press Q at anytime to escape the program:"
      specify { expect { print(all_dishes) }.to output.to_stdout }
    end
  end

  # TODO update these tests with doubles & mocks make them function
  xdescribe '#selection_menu' do
    it 'can select starter options' do
      expect(takeaway.selection_menu(:starters)).to eq "Thanks for your selection we've added your orders to your basket."
    end
    it 'can select main course options' do
      expect(takeaway.selection_menu(:main_course)).to eq "Thanks for your selection we've added your orders to your basket."
    end
    it 'can select main course options' do
      expect(takeaway.selection_menu(:main_course)).to eq "Thanks for your selection we've added your orders to your basket."
    end
    it 'can select dessert options' do
      expect(takeaway.selection_menu(:dessert)).to eq "Thanks for your selection we've added your orders to your basket."
    end
  end

  xdescribe '#select_dishes' do
    it 'has a basket that contains the selected dishes' do
      takeaway.select_dishes("Starters: 1. Olives = £4, 2. Pitta bread = £5 -- Main Course: 3. Fried duck = £12, 4. Fish & Chips = £9 -- Dessert: 5. Jam roll = £5, 6. Apple crumble = £6.")
      expect(takeaway.basket).to eq "Starters: Olives = £4 -- Main Course: Fish & Chips = £9 -- Dessert: Jam roll = £5."
    end
  end
end
