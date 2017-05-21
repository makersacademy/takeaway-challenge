require './lib/takeaway.rb'
require './lib/menu.rb'

describe Takeaway do
  let(:takeaway) { described_class.new }
  let(:menu) { takeaway.menu }
  # TODO use doubles throughout. e.g. allow(fake_menu).to receive(:menu).and_return(fake_menu)

  describe '#initialize' do
    it 'is initialized with a menu' do
      expect(takeaway.menu).to eq menu
    end
    it 'is initialized with a basket' do
      expect(takeaway.basket).to eq []
    end
  end

# TODO update tests with proper stdout format e.g expect(takeaway.lists_dishes_with_prices).to output(all_dishes).to_stdout
  xdescribe '#lists_dishes_with_prices' do
    it 'lists all menu dishes with prices' do
      all_dishes = specify { expect { print(all_dishes) }.to output.to_stdout }
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
      takeaway.select_dishes("Starters: Olives = £4", "Main Course: Fish & Chips = £9", "Dessert: Jam roll = £5")
      expect(takeaway.basket).to eq "Starters: Olives = £4 -- Main Course: Fish & Chips = £9 -- Dessert: Jam roll = £5."
    end
  end
end
