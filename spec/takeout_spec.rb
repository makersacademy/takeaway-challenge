require 'takeout'
require 'takeout_menu'

describe Takeout do
  describe '#show_menu' do
    it 'displays the menu' do
      menu = TakeoutMenu.new
      expect(subject.show_menu).to eq menu.menu_list
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
      expect(subject.total).to eq 6.98
    end
  end
end
