require 'order'
# order class spec for takeaway challenge
describe Order do

  subject(:order) { described_class.new }


  describe '#initialize' do
    it 'should be an instance of Order class' do
      expect(subject).to be_an_instance_of(Order)
    end
  end
  describe '#menu_options' do
    # it 'contains 3 meal-price pairs' do
    #   expect(subject.menu_options).to
    # end
  end
  describe ' #list_of_dishes' do
    it 'returns listed #menu_options with prices' do
      expect(subject.list_of_dishes).to eq(subject.menu_options)
    end
  end

  describe ' #place_order' do
    it 'should take in 3 params' do
      expect(subject).to respond_to(:place_order).with(3).argument
    end
    context 'param 1 : #chosen_meal' do
      it 'takes in selection' do
        expect(subject.chosen_meal).to eq('meal')
      end
    end

    context ' param 2: #dish_quantity' do
      it 'should show dish quantity' do
        expect(subject.dish_quantity).to eq 3
      end
    end

    context ' #total_sum'
  end

end
