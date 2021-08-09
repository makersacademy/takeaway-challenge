require 'restaurant'

describe Restaurant do
  let(:test_menu) { 
    " - - - - - - MENU - - - - - - \n1. Sushi £7\n2. Burger £6\n3. Fries £3\n4. Noodle Soup £10\n5. Bahn Mi £9.25\n" }
  let(:test_selection) { [{ dish: "Fries", price: 3 }, { dish: "Noodle Soup", price: 10 }] } 
  let(:place_order_text) { "Choose a menu number to add to your order\n" }
  let(:start_again_text) { "I've cleared your selection. Please select a first dish"}
  let(:no_auberg_on_menu_text) { "You have selected Aubergine\nSorry, that's not on the menu\n" }
  let(:no_10_on_menu_text) { "You have selected 10\nSorry, that's not on the menu\n" }
  let(:complete_order_text) { "Your order is as follows. Would you confirm? Y/N\n" } 

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
        subject.select_from_menu("10")
        expect{ subject.select_from_menu("exit") }.to change{ subject.current_order }
      end
    end

    context 'user input is not exit or numerical' do
      it 'prompts the user to try again' do
        # allow menu_item to eq "Aubergine"
        expect{ subject.select_from_menu }.to output(no_auberg_on_menu_text).to_stdout
      end
    end

    context 'numerical user input is not a menu item' do
      it 'prompts the user to try again' do
        expect{ subject.select_from_menu("10") }.to output(no_10_on_menu_text).to_stdout
      end
    end

    context 'selection is from menu' do
      it 'lets the user select dishes' do
        expect(subject).to respond_to(:select_from_menu).with(1).argument
      end

      it 'shows them their selection and total so far' 
    end
  end
  
  describe '#place_order' do
    it 'allows the user to place an order' do
      expect(subject).to respond_to(:place_order)
    end
  end

  describe '#complete_order' do
    it 'asks the user to confirm' do
      expect{ subject.complete_order }.to output(complete_order_text).to_stdout
    end
  end
end
    
  #   it 'asks the user to select a dish' do
  #     expect(subject.place_order).to output(:select_dish).to_stdout
  #   end

  #   it "let's the user select dishes until they're satisfied with their selection" do
  #     expect{ subject.place_order }.to change{ subject.customer_selection }
  #   end

  # end



# ## RUN ##
# testaurant = Restaurant.new
# testaurant.see_menu

# show menu
# let them pick item or reset
#loop until confirm
  # process their selection # check_selection? add_to_order(STDIN.gets.chomp)
  # show selection so far & total cost 
  # ask to choose another, confirm, or start again
# get phone number
# place order

# restaurant confirms order to customer SMS
# exit 

