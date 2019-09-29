require 'order'

describe Order do
  let(:dish) { double("Dish", name: 'shwarma', cost: 9) }
  let(:dish2) { double("Dish", name: 'pizza', cost: 5) }
  let(:dish3) { double("Dish", name: 'burger', cost: 7) }
  subject(:order) { described_class.new }

  describe '#dishes' do
    it 'contains a list of dishes' do
      expect(order.dishes.class).to eq Array
    end
  end

  describe '#add' do
    it 'adds a dish to dishes array' do
      expect(order.add(dish)).to eq [dish]
    end
  end

  describe '#remove' do
    context 'if a dish has been added' do
      before do
        order.add(dish)
      end
      it 'removes a dish from dishes array' do
        expect(order.remove(dish)).to eq []
      end
    end

    context 'if no dish has been added' do
      it 'raises an error message' do
        message = "Woah there, you haven't ordered this yet"
        expect { order.remove(dish2) }.to raise_error message
      end
    end
  end

  describe '#order_print' do
    context 'if a dish has been added' do
      before do
        order.add(dish)
      end
      it 'prints dish, price and quantity' do
        expect(STDOUT).to receive(:puts).with("1 x shwarma, £9")
        expect(order.order_print)
      end
    end

    context 'more than one dish has been added' do
      before do
        order.add(dish)
        order.add(dish)
        order.add(dish2)
      end
      it 'prints multiple dishes' do
        message = ['2 x shwarma, £9',
        '1 x pizza, £5']
        message.each { |x| expect(STDOUT).to receive(:puts).with(x) }
        expect(order.order_print)
      end
    end
  end

  describe '#review_total' do
    context 'if no dishes have been added' do
      it 'prints out message' do
        expect(STDOUT).to receive(:puts).with("Order something first!")
        expect(order.review_total)
      end
    end

    context 'if at least one dish has been added' do
      before do
        order.add(dish)
        order.add(dish3)
      end
      it 'prints out confirmation message' do
        expect(STDOUT).to receive(:puts).with("Order total is correct!")
        expect(order.review_total)
      end
    end
  end
end
