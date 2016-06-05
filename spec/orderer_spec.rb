require 'orderer'

describe Orderer do

  DISH1_NAME = 'Chicken Chow Mein'
  DISH1_PRICE = 5.4
  DISH2_NAME = 'Beef Chow Mein'
  DISH2_PRICE = 7.7
  subject(:subject){ described_class.new(restaurant.menu, messenger) }
  let(:restaurant) { double(:restaurant, menu: [dish1, dish2]) }
  let(:dish1) { double(:dish1, name: DISH1_NAME, price: DISH1_PRICE , to_s: "string1", subtotal: 4, subtotal_line: "string3") }
  let(:dish2) { double(:dish2, name: DISH2_NAME, price: DISH2_PRICE , to_s: "string2", subtotal: 4, subtotal_line: "string4") }
  
  let(:messenger) { double(:messenger, send: true) }
  
  describe '#show_all' do
    it 'returns a single string' do
      expect(subject.show_all).to be_a(String)
    end
    it 'inlcudes dish1' do
      expect(subject.show_all).to include(dish1.to_s)
    end
  end

  describe '#order' do
    it 'returns total quantity ordered' do
      quant1 = rand(3..8)
      quant2 = rand(10..15)
      subject.order(0, quant1)
      expect(subject.order(0, quant2)).to be(quant1+quant2)
    end
    it 'changes the whole order' do
      expect{ subject.order(0, rand(5..10)) }.to change{ subject.order_total }.by(dish1.subtotal)
    end
  end

  describe '#order_total' do
    it 'returns a Fixnum' do
      expect(subject.order_total).to be_a(Fixnum)    
    end
  end

  describe '#show_order' do
    it 'inlcudes dish1.subtotal_line' do
      subject.order(0, 1) 
      expect(subject.show_order).to include(dish1.subtotal_line)
    end
  end

  describe '#confirm' do
    it 'sends message to messager' do
      expect( messenger ).to receive(:send)
      subject.confirm
    end
  end

end
