require 'order'

describe Order do
  let(:dish) { double(:dish, name: (0...8).map { (65 + rand(26)).chr }.join) }
  let(:dish2) { double(:dish, name: (0...8).map { (65 + rand(26)).chr }.join) }
  let(:quant) { rand(2...10) }
  let(:quant2) { rand(2...10) }
  let(:price) { rand(10) }
  let(:price2) { rand(10) }
  let(:menu) { double(:menu, view: {dish => price, dish2 => price2}) }
  subject(:order) { described_class.new(menu)}

  describe '#initialize' do
    it 'is empty' do
      expect(order.summary).to be_empty
    end
    it 'has a total of zero' do
      expect(order.total).to eq 0
    end
  end

  describe '#add' do
    before{ order.add(dish, quant) ; order.add(dish2, quant2) }
    let(:total) { (menu.view[dish] * quant) + (menu.view[dish2] * quant2) }
    it 'adds the dish to the order' do
      expect(order.summary).to include(dish.name, dish2.name)
    end
    it 'adds the dish to the order the correct amount of times' do
      expect(order.summary.length).to eq quant + quant2
    end
    it 'updates the total' do
        expect(order.total).to eq total
      end
  end
end
