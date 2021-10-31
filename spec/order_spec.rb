require './lib/order.rb'

describe Order do
  let(:menu) { Menu.new }
  let(:dish) { { name: "Chips", price: 2} }
  let(:dish2) { { name: "Cheese burger", price: 10} }
  let(:quantity) { 2 }

  describe '#intialize' do
    it 'initializes an empty order' do
    expect(subject.basket).to be_empty
    end
  end

  describe '#add_dish' do
    it 'adds dish to basket' do
      expect { subject.add_dish(dish, 1) }.to change { subject.basket.length }.by(1)
    end
  end

  describe '#display_basket' do
    it 'displays the contents of the basket' do
      subject.add_dish(dish[:name], quantity)
      expect(subject.display_basket).to include dish
    end
  end
end




# Note I would like to be able to
# select some number of several available dishes