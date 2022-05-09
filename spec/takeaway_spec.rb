require 'takeaway'
require 'dishes'
require 'order'

describe Takeaway do
  describe '#new' do
    it 'lists the available dishes when a new takeaway is created' do
      expect(subject.list_of_dishes).to be_an_instance_of(ListOfDishes)
    end

    it 'sets the current order to not be completed' do
      expect(subject.current_order_completed).to eq false
    end
  end

  describe '#format_menu' do
    it 'formats the available dishes to be viewed as a menu' do
      subject.format_menu
      expect(subject.list_of_dishes.all_dishes).not_to be nil
    end
  end

  describe '#print_menu' do
    it 'lets the customer decide to look at the menu' do
      expect(subject.print_menu).to include("The available dishes are: ")
    end
  end

  describe '#take_order' do
    it 'allows the user to select a dish and a quantity and add it to the current order' do
      subject.take_order(4, 2)
      subject.take_order(1, 3)
      expect(subject.show_current_order).not_to be nil
    end
  end

  describe 'current_order' do
    it 'shows the customer their current order' do
      subject.take_order(4, 2)
      subject.take_order(1, 3)
      expect(subject.show_current_order).to include 'Your current order is: '
    end

    it 'tells the customer that they havent added a dish to their order when they havent ordered anything yet' do
      expect(subject.show_current_order).to include "You haven't"
    end
  end

  describe '#cost_of_order' do
    it 'returns the current cost of the entire customer order' do
      subject.take_order(4, 2)
      subject.take_order(1, 3)
      expect(subject.cost_of_order).to eq 17
    end
  end

  describe '#finish_order' do
    it 'sects the current order to be finished' do
      subject.take_order(4, 2)
      subject.finish_order
      expect(subject.current_order.order_completed).to be true
    end
  end

  describe '#finish_order' do
    it 'sects the current order to be finished' do
      subject.take_order(4, 2)
      expect(subject.finish_order).to include "which comes to a total of"
    end
  end

end
