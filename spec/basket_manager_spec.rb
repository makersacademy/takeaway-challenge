require './lib/basket_manager.rb'

describe Basket_manager do

  describe '#access_menu' do
    context 'when we attempt to access the menu' do
      it 'allows us to see the menu' do
    expect(subject.access_menu).to eq (  Menu::CHINESE_MENU)
      end
    end
  end

  describe '#add_to_basket' do
      it 'adds an item to current order' do
        current_order = []
        dish = "King Prawns"
        subject.add_to_basket(dish)
        expect(current_order).to eq(3.25)
      end

      it 'recognises that a diash does not exist' do
        dish = "Tomato"
        expect(subject.add_to_basket(dish)).to eq(basket_manager.display_menu)
      end
  end

  describe '#remove_item' do

    it 'deletes an item from the order' do
      current_order = [["King Prawns",3.25], ["King Prawns",3.25]]
      removed_item = "King Prawns"
      subject.remove_item(removed_item)
      expect(current_order).to eq [["King Prawns",3.25]]
    end

    #Check for an item that is not part of my Order
    it 'deletes an item from the order' do
      current_order = [["King Prawns",3.25], ["King Prawns",3.25]]
      removed_item = "Chilly"
      subject.remove_item(removed_item)
      expect(current_order).to eq [["King Prawns",3.25]]
    end
  end
end
