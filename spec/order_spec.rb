require 'order'

describe Order do
  let(:dish) { double(:dish, name: (0...8).map { (65 + rand(26)).chr }.join) }
  let(:quantity) { rand(2...10) }
  let(:menu) { double(:menu, view: {dish => quantity}) }
  subject(:order) { described_class.new(menu)}

  describe '#add' do
    before{ order.add(dish, quantity) }
    it 'adds the dish to the order' do
      expect(order.summary).to include dish.name
    end
    it 'adds the dish to the order the correct amount of times' do
      expect(order.summary.length).to eq quantity
    end
  end
end