require 'takeaway'

describe Takeaway do
  let(:menu_klass) { double(:menu_klass, new: menu) }
  let(:dishes) { {menuitem1: 1, menuitem2: 1.50 } }
  let(:menu) { double(:menu, show: dishes, dishes: dishes)}

  subject(:takeaway) { described_class.new(menu_klass: menu_klass) }

  describe '#show_menu' do
    it 'shows a list of menu items' do
      expect(takeaway.show_menu).to eq dishes
    end
  end

  describe '#order' do
    context 'item not available' do
      it 'raises an error' do
        msg = 'This item is not on the menu'
        expect {takeaway.order('Hamburger', 25)}.to raise_error msg
      end
    end
    context 'first order' do
      it 'stores name and quantity of dish in basket' do
        takeaway.order(:menuitem1, 2)
        expect(takeaway.basket).to include(menuitem1: 2)
      end
    end
    context 'additional orders' do
      it 'stores name and quantity of dish in basket' do
        takeaway.order(:menuitem1, 2)
        takeaway.order(:menuitem1, 2)
        expect(takeaway.basket).to include(menuitem1: 4)
      end
    end
  end

  describe '#checkout' do
    context 'when total given by user corresponds to calculated total' do
      it 'sends a confirmation text message' do
        takeaway.order :menuitem1, 2
        mgs = "menuitem1 x2: £2", "Total price: £2"
        expect(takeaway).to receive(:send_text).with(msg)
        takeaway.checkout(2)
      end
    end
    context 'total given by user does not correspond to calculated total' do
      it 'raises an error' do
        takeaway.order( :menuitem2,  5)
        expect {takeaway.checkout(7)}.to raise_error 'Wrong total'
      end
    end
  end

  describe '#basket_content' do
    context 'empty' do
      it 'raises an error' do
        expect {takeaway.basket_content}.to raise_error 'Basket is empty'
      end
    end
    context 'has items' do
      it 'shows items and the total' do
        result = "menuitem1 x2: £2\nmenuitem2 x5: £7.5"
        takeaway.order :menuitem1, 2
        takeaway.order :menuitem2, 5
        expect(takeaway.basket_content).to eq result
      end
    end
  end

  describe '#total' do
    it 'shows the total price to pay for ordered items' do
      takeaway.order :menuitem1, 2
      takeaway.order :menuitem2, 5
      expect(takeaway.total).to eq "Total price: £9.5"
    end
  end

  describe '#reset_order' do
    it 'after checkout basket is empty' do
      takeaway.order :menuitem1, 2
      takeaway.reset_order
      expect {takeaway.basket_content}.to raise_error 'Basket is empty'
    end
  end
end
