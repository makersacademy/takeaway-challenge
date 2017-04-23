require 'order.rb'

describe Order do
  let(:dish) { :pesto }

  describe '#see_dishes' do

    it 'shows the dishes' do
      expect(subject.see_dishes).to eq Order::DISHES
    end
  end

  describe '#add_dish' do
    context 'when a customer types in a dish from the dishes list' do

      it 'adds a dish' do
        # allow(dish).to receive(:to_sym).and_return(:pesto)
        subject.add_dish(dish)
        expect(subject.summary).to include { dish }
      end
    end

    context 'when a customer types in an inexistent dish' do

      it 'raises an error' do
        message = "Sorry, dish not found"
        expect { subject.add_dish('non_existent_dish') }.to raise_error message
      end
    end
  end

  describe '#remove_dish' do
    it 'removes a dish from the customer\'s order' do
      subject.add_dish(dish)
      subject.remove_dish(dish)
      expect(subject.summary).not_to include { dish }
    end
  end

  describe '#summary' do
    let(:order) { :order }
    let(:total) { :total }
    it 'returns the list of dishes, their quantities and the total' do
      subject.add_dish(dish)
      subject.add_dish(dish)
      expect(subject.summary).to eq({ order => { dish => 2 }, total => 13.0 })
    end
  end

  describe '#total_checker' do
    let(:dish) { :lasagna }
    context 'when the total spent triggers Free Delivery' do
      it 'does not add the delivery fee' do
        subject.add_dish(dish)
        subject.add_dish(dish)
        subject.add_dish(dish)
        subject.add_dish(dish)
        expect(subject.summary).to include { @delivery_fee = 0 }
      end
    end

    context 'when the total spent does not trigger Free Delivery' do
      it 'adds the £3 delivery fee' do
        subject.add_dish(dish)
        subject.add_dish(dish)
        expect(subject.summary).to include { @delivery_fee = 3 }
      end
    end
  end

end
