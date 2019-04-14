require 'takeout'
require 'menu'

describe Takeout do
  describe '#show_menu' do
    it 'displays the menu' do
      menu = Menu.new
      expect(subject.show_menu).to eq menu.menu_display
    end
  end
  describe '#add_order' do
    it 'returns error if selected food is not on the menu' do
      expect { subject.add_order("foobar", 1, 1) }.to raise_error "That is not on the menu!"
    end
    it 'adds food to order array' do
      subject.add_order("Mozzarella Sticks", 2, 6.98)
      expect(subject.order).to eq ["Mozzarella Sticks", "Mozzarella Sticks"]
    end
    it 'adds price to total price' do
      subject.add_order("Mozzarella Sticks", 2, 6.98)
      expect(subject.total_given).to eq 6.98
    end
  end
  describe '#finish_order' do
    it 'confirms that the total is equal to the accumulated price of each item ordered' do
      subject.add_order("Mozzarella Sticks", 2, 6.98)
      expect(subject.finish_order).to eq subject.total_given
    end
    it 'raises an error if total given and true total are not equal' do
      subject.add_order("Mozzarella Sticks", 2, 5.98)
      expect { subject.finish_order }.to raise_error "Total given doesn't match true total."
    end
  end
end
