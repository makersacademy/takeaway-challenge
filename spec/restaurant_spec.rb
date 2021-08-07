require 'restaurant'

describe Restaurant do
  let(:test_menu) { 
    " - - - - - - MENU - - - - - - \n1. Sushi £7\n2. Burger £6\n3. Fries £3\n4. Noodle Soup £10\n5. Bahn Mi £9.25\n" }
  let(:test_selection) { [{ dish: "Fries", price: 3 }, { dish: "Noodle Soup", price: 10 }] } 
  let(:place_order_text) { "Choose a menu number to add to your order\n" }
  let(:start_again_text) { "I've cleared your selection. Please select a first dish"}

  describe '#initialize' do
    it 'has a list of dishes with prices' do
      expect(subject.menu).to_not be_nil
    end
  end

  describe '#see_menu' do
    it 'allows the user to see the dishes, with menu number and price' do
      expect{ subject.see_menu }.to output(test_menu).to_stdout
    end
  end

  describe '#select_from_menu' do
    context 'user input is exit' do
      it 'clears the customer\'s selection so far' do
        subject.select_from_menu("exit")
        expect(subject.customer_selection).to eq []
      end
    end

    context 'user input is not exit or numerical' do
      it 'raises an error' do
        expect{ subject.select_from_menu("Aubergine") }.to raise_error("Sorry, that's not on the menu")
      end
    end

    context 'numerical user input is not a menu item' do
      it 'raises an error' do
        expect{ subject.select_from_menu(10) }.to raise_error(RuntimeError, "Sorry, that's not on the menu")
      end
    end

  #   it 'lets the user select dishes' do
  #     subject.select_from_menu(3)
  #     subject.select_from_menu(4)
  #     expect(subject.customer_selection).to eq test_selection
  #   end
  # end

  # describe '#place_order' do
  #   it 'allows the user to place an order' do
  #     expect(subject).to respond_to(:place_order)
  #   end
    
  #   it 'asks the user to select a dish' do
  #     expect(subject.place_order).to output(:select_dish).to_stdout
  #   end

  #   it "let's the user select dishes until they're satisfied with their selection" do
  #     expect{ subject.place_order }.to change{ subject.customer_selection }
  #   end

  #   it 'creates a new order' do
  #     expect(subject.place_order).to be_an(Order)
  #   end
  # end
end


# ## RUN ##
# testaurant = Restaurant.new
# testaurant.see_menu

# show menu
# let them pick item (or exit?)
#loop until confirm
  # process their selection # check_selection? add_to_order(STDIN.gets.chomp)
  # show selection so far & total cost 
  # ask to choose another, confirm, or start again
# get phone number
# place order

# restaurant confirms order to customer SMS
# exit 
end