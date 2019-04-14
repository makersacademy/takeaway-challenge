require 'order'

describe Order do
  describe '#add_dish' do
    it 'adds dish and qty to items hash'
  end

  describe '#print_order' do
    it 'prints receipt with total price from items 
    in items hash using prices from menu' do
      menu = double :menu
      allow(menu).to receive(:dishes).and_return({ pizza: 6, pasta: 7 })
      receipt = "pizza x3 ... £18
pasta x2 ... £14
TOTAL ...... £32"
      subject.add_dish('pizza', 3)
      subject.add_dish('pasta', 2)
      expect(subject.print_order(menu)).to eq receipt
    end
  end
end
