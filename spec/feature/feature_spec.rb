require 'capybara/rspec'
require 'takeaway'

describe 'Customer features' do
  subject(:takeaway) { Takeaway.new(menu_name: :italian) }

  feature 'see name and prices of dishes on menu' do
    it 'includes menu item' do
      expect(takeaway.show_menu).to match('Lasagne Al Forno: £10.5')
    end
  end

  feature 'select dishes from the menu' do
    it 'adds dishes to basket' do
      takeaway.place_order('Lasagne Al Forno', 3)
      expect(takeaway.show_order).to include('Lasagne Al Forno x3')
    end
    it 'returns message to order 1 item or more' do
      msg = 'Please order 1 or more items'
      expect(takeaway.place_order 'Lasagne Al Forno', 0).to eq msg
    end
    it 'returns message when item not on menu' do
      msg = 'This item is not on the menu'
      expect(takeaway.place_order 'Something foreign', 1).to eq msg
    end
  end

  feature 'see total of price to pay' do
    it 'before checkout' do
      takeaway.place_order('Lasagne Al Forno', 3)
      takeaway.place_order('Fettuccine Al Salmone', 3)
      expect(takeaway.show_order).to match('Total price: £64.35')
    end
  end
  
  feature 'when checking out' do
    it 'returns message that total is not right' do
      takeaway.place_order('Fettuccine Al Salmone', 3)
      expect(takeaway.checkout_order 30.95).to eq 'Wrong total'
    end
  end
end
