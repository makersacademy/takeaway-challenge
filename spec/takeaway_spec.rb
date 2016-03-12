require 'takeaway'

describe Takeaway do

  describe '#menu' do

    it 'initializes with a menu' do
      expect(subject.menu).not_to be_empty
    end

    it 'allows a customer to view the menu' do
      expect(subject.menu).to eq menu
    end

    it 'allows the takeaway to add new items to the menu' do
      subject.add_to_menu(dish, price)
      expect(subject.menu.last).to eq {dish => price}
    end

  end

end
