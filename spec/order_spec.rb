require 'order'

describe Order do
  let(:dish) { double(:dish, name: (0...8).map { (65 + rand(26)).chr }.join) }
  let(:dish2) { double(:dish, name: (0...8).map { (65 + rand(26)).chr }.join) }
  let(:dish3) { double(:dish, name: (0...8).map { (65 + rand(26)).chr }.join) }
  let(:quant) { rand(2...10) }
  let(:quant2) { rand(2...10) }
  let(:price) { rand(1...10) }
  let(:price2) { rand(1...10) }
  let(:menu) { double(:menu, view: {dish.name => price, dish2.name => price2}) }
  subject(:order) { described_class.new(menu)}

  describe '#initialize' do
    it 'is empty' do
      expect(order.summary.keys.size).to eq 1
    end
    it 'has a total of zero' do
      expect(order.summary[:total]).to eq 0
    end
  end

  describe '#add' do
    context 'valid order' do
      before{ order.add(dish, quant) ; order.add(dish2, quant) }
      let(:expected) { (menu.view[dish.name] + menu.view[dish2.name]) * quant }
      it 'adds the dish to the order' do
        expect(order.summary).to include(dish.name, dish2.name)
      end
      it 'adds the dish to the order the correct amount of times' do
        expect(order.summary[dish.name]).to eq quant
      end
      it 'updates the total' do
          expect(order.summary[:total]).to eq expected
      end
    end
    context 'item on menu' do
      it 'raises an error' do
        expect{ order.add(dish3, quant) }.to raise_error(Order::MENU_ERR)
      end
    end
  end
end
