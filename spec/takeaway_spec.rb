require 'takeaway.rb'

describe Takeaway do

  let(:menu) { double :menu }
  subject(:sms) { described_class.new }

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
      don_quant = 1
      bur_quant = 0
      piz_quant = 0
      subject.order_food(don_quant, bur_quant, piz_quant)
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
      expect(subject.payment(10)).to eq sms
    end
  end
end
