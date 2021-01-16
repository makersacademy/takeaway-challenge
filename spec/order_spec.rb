require 'order'

describe Order do

  describe '#add_dish' do

    let(:dish) { double("dish") }
    
    it 'Checks if one dish has been added to the array' do
      expect(dish).to receive(:[]=).with("quantity", Order::MINIMUM_QUANTITY)
      subject.add_dish(dish)

      expect(subject.dishes).to include(dish)
    end

    it 'Checks if more than one dish has been added to the array' do
      expect(dish).to receive(:[]=).with("quantity", 5)
      subject.add_dish(dish, 5)

      expect(subject.dishes).to include(dish)
    end

  end

end