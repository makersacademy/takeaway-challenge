require 'menu'

describe Menu do

  subject(:menu) { described_class.new}
  let(:dish_class) { double :dish_class, new: dish}
  let(:dish) { double :dish}
  let(:name) { double :name}
  let(:price) { double :price}
  let(:dishes) { double :dishes}

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
      allow(menu).to receive(:display)
      expect(menu.display).to be_truthy
    end
  end
end
