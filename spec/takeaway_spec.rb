require 'Takeaway.rb'

describe Takeaway do

  let(:menu) { double :menu }

  describe '#menu' do
    it 'stores a list of all dishes and prices' do
      menu = [["doner", 5], ["burger", 10], ["pizza", 20]]
      allow(subject).to receive(:menu).and_return([["doner", 5], ["burger", 10], ["pizza", 20]])
    end
  end

  describe '#show_menu' do
    it 'displays menu items to customer' do
      menu = [["doner", 5], ["burger", 10], ["pizza", 20]]
      allow(subject.show_menu(menu)).to receive(:menu).and_return("doner 5\nburger 10\npizza 20")
    end
  end

  describe '#order_food' do
    it 'selects the food for each order' do
      doners = 1
      burgers = 0
      pizzas = 0
      subject.order_food(doners, burgers, pizzas)
      expect(subject.bill).to eq(5)
    end
  end

  describe '#payment' do
    it 'raises an error if payment is incorrect' do
      bill = 10
      expect { subject.payment(50) }.to raise_error "Your payment is incorect."
    end

    it 'verifies the payment matches bill and the food will be delivered on time' do
      bill = 10
      expect(subject.payment(10)).to eq "Thank you! Your order was placed and will be delivered before 18:52"
    end
  end
end
