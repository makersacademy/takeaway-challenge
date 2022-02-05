require_relative '../lib/takeaway'

describe Takeaway do
  describe '#display_menu' do
    it 'should start with no dishes on a menu' do
      expect(subject.display_menu).to be_empty
    end
  end

  describe '#add_dish_to_menu' do
    it 'should add one dish to the menu' do
      subject.add_dish_to_menu(:dish_1, 10)
      expect(subject.menu.size).to eq 1
    end
  end

  describe '#display_menu' do
    it 'should display dishes on a menu' do
      subject.add_dish_to_menu(:dish_1, 10)
      subject.add_dish_to_menu(:dish_2, 12)
      subject.add_dish_to_menu(:dish_3, 14)
      expect(subject.display_menu).to eq { :dish_1 => 10, :dish_2 => 12, :dish_3 => 14 }
    end
  end

end
