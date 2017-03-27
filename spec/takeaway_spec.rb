require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new }
  let(:item) { double :item }
  let(:order) { double :order }
  let(:menu) { double :menu, print: printed_menu }
  let(:printed_menu) {"Hamburger £3.99, Pizza £9.99, Fish and Chips £4.99, Curry £5.99, Deep Fried Mars Bar £0.99, Coke Zero £1.99"}
  let(:sms) { double :sms }
  let(:item) {"Pizza"}
  let(:quantity) {2}

  describe '#initialize' do
    it 'has an empty basket' do
      expect(takeaway.basket).to be_empty
    end

  end

  describe '#view_menu' do
    it 'prints menu to user' do
      expect(takeaway.view_menu).to eq printed_menu
    end

    it 'shows the menu with the dishes and prices' do
      expect(takeaway.view_menu).to eq(printed_menu)
    end
  end

  describe '#add' do
    it 'takes 2 arguments' do
      expect(takeaway).to respond_to(:add).with(2).argument
    end

    it 'can order some number of several available dishes' do
      takeaway.add(item,quantity)
      expect(takeaway.basket).to include(item)
    end
  end

  describe '#total' do
    it 'when empty is 0.00' do
      expect(takeaway.total).to eq 0.00
    end

    it 'knows the order total' do
      takeaway.add(item,quantity)
      expect(takeaway.total).to eq(19.98)
    end
  end

  describe '#checkout' do
    it 'raises an error if input value is wrong' do
      total = 3.99
      expect{takeaway.checkout(4.99)}.to raise_error("Checkout total incorrect")
    end
  end
end
