require './lib/takeaway.rb'

describe Takeaway do
  let(:takeaway) { described_class.new }

  describe '#initialize' do
    it 'is initialized with dishes' do
      complete_menu = { :starters => { 1 => { "Olives" => 4 } , 2 => { "Pitta bread" => 5 } }, :main_course => { 3 => { "Fried duck" => 12 }, 4 => { "Fish & Chips" => 9 } }, :dessert => { 5 => { "Jam roll" => 5 }, 6 => { "Apple crumble" => 6 } } }
      expect(takeaway.menu).to eq complete_menu
    end
    it 'is initialized with a basket' do
      expect(takeaway.basket).to eq []
    end
  end

# TODO update tests with proper stdout format e.g expect(takeaway.lists_dishes_with_prices).to output(all_dishes).to_stdout
  describe '#lists_dishes_with_prices' do
    it 'lists all menu dishes with prices' do
      all_dishes = "Starters: 1. Olives = £4, 2. Pitta bread = £5 -- Main Course: 3. Fried duck = £12, 4. Fish & Chips = £9 -- Dessert: 5. Jam roll = £5, 6. Apple crumble = £6."
      expect(takeaway.lists_dishes_with_prices).to eq all_dishes

    end
  end

# TODO update these tests to make sure that can choose 0 or Q 
  describe '#displays_controller' do
    it 'displays a message to prompt user to move to navigate to the selection menu and instructions to quit' do
      expect(takeaway.displays_controller).to eq "Welcome to our takeaway service. Please make your order by selecting 0 to be taken to the selection menu, press Q at anytime to escape the program:"
    end
  end

# TODO update these tests with doubles & mocks make them function
  describe '#selection_menu' do
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
      takeaway.select_dishes("Starters: Olives = £4", "Main Course: Fish & Chips = £9", "Dessert: Jam roll = £5" )
      expect(takeaway.basket).to eq "Starters: Olives = £4 -- Main Course: Fish & Chips = £9 -- Dessert: Jam roll = £5."
    end
  end
end
