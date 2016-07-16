require 'menu'

describe Menu do
  describe '#inialization' do
    subject { described_class.new }
  end
  let(:dish) { Dish.new("fish",14) }

  describe 'class methods' do
    it { is_expected.to(respond_to(:menu_items)) }
    it { is_expected.to(respond_to(:add_dish)) }
  end

  describe '#add_dish' do
    it 'adds a dish to menu' do
      subject.add_dish(dish)
      expect(subject.menu_items).to have_key(dish.name)
      expect(subject.menu_items).to have_value(dish.price)
    end
  end
end
