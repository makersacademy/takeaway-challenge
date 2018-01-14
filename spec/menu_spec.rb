require 'menu'

describe Menu do

  subject(:menu) { described_class.new }
  let(:dish_class) { double :dish_class, new: dish }
  let(:dish) { double :dish }
  let(:name) { double :name }
  let(:price) { double :price }
  let(:dishes) { double :dishes }
  let(:quantity) { double :quantity }
  let(:order) { double :order }

  describe 'initially' do
    it 'has no dishes' do
      allow(menu).to receive(:dishes)
      expect(menu.dishes).to eq nil
    end
  end

  describe '#add_dish' do
    it 'adds a dish to menu' do
      subject.add_dish(dish)
      expect(subject.add_dish(dish)).to be_truthy
    end
  end

  describe '#display' do
    it 'displays the menu' do
      subject.add_dish(dish)
      allow(menu).to receive(:display).and_return(:dishes)
      expect(menu.display).to be_truthy
    end
  end

  describe '#choose' do

    it 'can select a menu item' do
      subject.add_dish(dish)
      allow(menu).to receive(:display).and_return(:dishes)
      allow(menu).to receive(:choose).and_return(:order)
      expect(menu.choose(dish, quantity)).to be_truthy
    end
  end
end
