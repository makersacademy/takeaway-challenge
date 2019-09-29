require 'basket'

describe Basket do
  let(:order) { double('Order') }
  let(:order2) { double('Order') }

  let(:dish) { 'Chicken Poke' }
  let(:quantity) { 2 }
  let(:price) { 7.99 }
  let(:dish2) { 'Salmon Poke' }
  let(:quantity2) { 1 }
  let(:price2) { 8.99 }

  before do
    allow(order).to receive(:dish).and_return(dish)
    allow(order).to receive(:quantity).and_return(quantity)
    allow(order).to receive(:quantity=)
    allow(order).to receive(:price).and_return(price)
    allow(order).to receive(:price=)
    allow(order).to receive(:total_price).and_return(quantity * price)

    allow(order2).to receive(:dish).and_return(dish2)
    allow(order2).to receive(:quantity).and_return(quantity2)
    allow(order2).to receive(:price).and_return(price2)
    allow(order2).to receive(:total_price).and_return(quantity2 * price2)
  end

  describe '#initialize' do
    it 'has an empty basket by default' do
      expect(subject.basket).to be_empty
    end
  end

  describe '#add_item' do
    it 'adds the order to the basket' do
      subject.add_item(order)
      expect(subject.basket).to include order
    end

    it 'adds the same order twice' do
      allow(order).to receive(:quantity).and_return(quantity * 2)
      allow(order).to receive(:total_price).and_return(quantity * price * 2)
      subject.add_item(order)
      subject.add_item(order)
      result = "Chicken Poke x4 = £31.96\n"
      expect { subject.print_basket }.to output(result).to_stdout
    end
  end

  describe '#print_basket' do
    it 'prints the basket' do
      subject.add_item(order)
      subject.add_item(order2)
      result = "Chicken Poke x2 = £15.98\nSalmon Poke x1 = £8.99\n"
      expect { subject.print_basket }.to output(result).to_stdout
    end
  end

  describe '#check_total' do
    it 'prints the total' do
      subject.add_item(order)
      subject.add_item(order2)
      result = "Total: £24.97\n"
      expect { subject.check_total }.to output(result).to_stdout
    end
  end
end
