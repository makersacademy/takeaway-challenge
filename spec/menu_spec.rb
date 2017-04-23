require 'menu'
require 'order'

describe Menu do

  subject(:menu){ described_class.new}

  describe '#show_menu' do
      it 'should give a list of available pizzas' do
        expect(menu.show_menu).to eq subject.menu
      end
    end

  describe '#show_order' do
    it 'should show contents of current order' do
      expect(menu.show_order).to eq subject.order
      end
    end

  describe '#place_order' do
    it 'allows the customer to place an order' do
      subject.place_order("Pepperoni")
      expect(subject.order).to include ("Pepperoni")
    end
    it 'raises an error if ordered dish not on menu' do
      expect{subject.place_order("Garlic Bread")}.to raise_error "Sorry, this dish is not on the menu."
    end
  end

  describe '#total_cost' do
    it 'calculates the cost of the order' do
      subject.place_order("Pepperoni")
      subject.place_order("Meat Feast")
      expect(subject.total_cost).to eq(18)
    end
  end 
 end
