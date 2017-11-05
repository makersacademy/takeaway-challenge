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
    it 'prints listed menu_options with prices' do
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

    it ' should push to basket_summary' do
      subject.order('Miso Soup', 2)
      expect(subject.basket_summary).to eq([{ quantity: 2, chosen_meal: 'Miso Soup' }])
    end
  end

  describe ' #print_basket_summary' do
    it 'should print all items with quantities' do
      subject.order('Miso Soup', 2)
      printed_message = '2 of Miso Soup,'
      expect(subject.print_basket_summary).to eq(printed_message)

    end
  end

end
