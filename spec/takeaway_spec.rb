require './lib/takeaway.rb'
# order class spec for takeaway challenge
describe TakeAway do

  subject(:takeaway) { described_class.new }

  describe '#initialize' do
    it 'should be an instance of TakeAway class' do
      expect(subject).to be_an_instance_of(TakeAway)
    end
  end

  describe ' #list_of_dishes' do
    it 'prints listed #menu_options with prices' do
      expect(subject.list_of_dishes).to eq(subject.menu_options)
    end
  end

  describe ' #menu_options' do
    it 'represents meal-value pairs' do
      expect(subject.menu_options).to be_kind_of(Hash)
    end
  end

  describe ' #order' do
    it 'should take in 2 params' do
      expect(subject).to respond_to(:order).with(2).arguments
    end
    it 'should set default quantity to 1' do
      order1 = subject.order('Miso Soup')
      expect(order1).to eq(subject.order('Miso Soup', 1))
    end

    it ' should be added to basket summary' do
      subject.order('Miso Soup', 2)
      subject.add_to_basket
      string = "#{quantity} of #{chosen_meal}"
      expect(subject.basket_sumarry).to include(string)
      expect(subject.order).to eq(message)
    end

  end

end
