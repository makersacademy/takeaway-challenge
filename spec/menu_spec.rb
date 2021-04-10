require 'menu'

describe Menu do
  context '#menu_list' do
    it 'should display the menu' do
      expect(subject.list).not_to be_empty
    end
  end

  context '#add_dish' do
    it 'should allow do add a dish into the basket' do
      subject.add_dish('German Burger', 6)
      expect(subject.basket).not_to be_empty
    end
  end
end
