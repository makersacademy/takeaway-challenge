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
    it 'returns the order with the dish name and their quantities, and the total' do
      subject.add_dish(dish)
      subject.add_dish(dish)
      expect(subject.summary).to eq({ order => { dish => 2 }, total => 13 })
    end
  end

  describe '#check_out' do
    context 'when the minimum order total is not met' do
      it 'raises an error' do
        message = "Minimum order is #{Order::MINIMUM_ORDER}."
        expect { subject.check_out }.to raise_error message
      end
    end

    context 'when the minimum order total is met' do
      it 'sends an SMS and returns a thank you message' do
        subject.add_dish(dish)
        subject.add_dish(dish)
        subject.add_dish(dish)
        subject.add_dish(dish)
        message = 'Thank you for ordering with us! You will receive a confirmation SMS shortly.'
        expect(subject.check_out).to eq message
      end
    end
  end

end
