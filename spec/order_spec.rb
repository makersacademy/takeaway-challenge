require 'order'

describe Order do
  let(:pizza_double) { double(:dish_pizza, id: :Pizza, price: 2) }
  let(:lasagne_double) { double(:dish_lasagne, id: :Lasagne, price: 5) }
  describe '#initialize' do

  end

  describe '#add' do
    it { is_expected.to respond_to(:add).with(1).argument }
    
    it 'add dish and quantity to order' do
      subject.add(lasagne_double => 1, pizza_double => 2)
      expect(subject.current_order).to eq({
          lasagne_double => 1, 
          pizza_double => 2
        })
    end

    it 'increases dish quantity if already in order' do
      subject.add(lasagne_double => 1, pizza_double => 2)
      subject.add(lasagne_double => 10)
      expect(subject.current_order).to eq({
        lasagne_double => 11,
        pizza_double => 2                
      })
    end
  end

  describe '#calculate' do
    it { is_expected.to respond_to(:calculate) }

    it 'adds up all items prices and returns a receipt' do
      subject.add(lasagne_double => 1, pizza_double => 2)
      receipt = "Receipt\nLasagne x 1: £5\nPizza x 2: £4\nTotal: £9"
      expect(subject.calculate).to eq(receipt)
    end
  end

  describe '#text' do
    it { is_expected.to respond_to(:text).with(1).argument }

    it 'calls text with a number' do
        allow(subject).to receive(:text).and_return("Message sent!")
        expect(subject.deliver(Secrets::PERSONAL_NUMBER)).to eq("Message sent!")
    end
  end
end
