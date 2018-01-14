require 'menu'

describe Menu do

  subject(:menu) { described_class.new }
  let(:dish_class) { double :dish_class, new: dish }
  let(:dish) { double :dish }
  let(:name) { double :name }
  let(:price) { double :price }
  let(:quantity) { double :quantity }
  let(:order) { double :order }

  describe 'initially' do
    it 'has no dishes' do
      expect(menu.menu).to be_empty
    end
  end

  describe '#add' do
    it 'adds a dish to menu' do
      subject.add(dish, price)
      expect(subject.add(dish, price)).to be_truthy
    end
  end

  describe '#display' do
    it 'displays the menu' do
      subject.add(dish, price)
      allow(menu).to receive(:display).and_return(:dishes)
      expect(menu.display).to be_truthy
    end
  end

  describe '#choose' do

    it 'can select a menu item' do
      subject.add(dish, price)
      allow(menu).to receive(:display).and_return(:dishes)
      allow(menu).to receive(:choose).and_return(:order)
      expect(menu.choose(dish, quantity)).to be_truthy
    end
  end
end
