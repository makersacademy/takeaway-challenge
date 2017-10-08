require 'takeaway.rb'

describe Takeaway do

  let(:available_dishes) { double :available_dishes }
  subject(:sms) { described_class.new }
  subject(:struct) { described_class.new }
  let(:initialise) { double :initialise }
  let(:menu_data) { double :menu_data }

  describe '#initialize' do
    it 'stores the menu data struct in as an instance variable' do
      subject.menu_data
     expect(subject.available_dishes).to eq(struct)
  end
end

  describe '#menuify' do
    it 'creates a struct to store menu data' do
       allow(subject.menuify).to receive(:menu_data).and_return(:struct)
     end
  end

  describe '#print_menu' do
    it 'displays menu items to customer' do
      allow(subject.print_menu).to receive(:available_dishes).and_return("doner 5\nburger 10\npizza 20")
    end
  end

  describe '#doner_order' do
    it 'take doners order and returns the costs' do
      subject.doner_order(2)
      expect(subject.doners_total).to eq(10)
    end
  end

  describe '#burger_order' do
    it 'take burger order and returns the costs' do
      subject.burger_order(2)
      expect(subject.burger_total).to eq(20)
    end
  end

  describe '#pizza_order' do
    it 'take pizza order and returns the costs' do
      subject.pizza_order(2)
      expect(subject.pizza_total).to eq(40)
    end
  end

  describe '#payment' do
    it 'raises an error if payment is incorrect' do
      bill = 10
      expect { subject.payment(50) }.to raise_error "Your payment is incorect."
    end

    it 'verifies the payment matches bill and the food will be delivered on time' do
      bill = 10
      expect(subject.payment(10)).to eq sms
    end

  end
end
