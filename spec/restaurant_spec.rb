require 'restaurant'

describe Restaurant do

  let(:subject) {Restaurant.new(order_class, menu, messenger)}
  let(:order_class) {double(:order_class, new: order)}
  let(:order) {double(:order)}
  let(:menu) {double(:menu)}
  let(:messenger) {double(:messenger)}

  let(:quantity) {double :quantity}
  let(:item) {double :item}

  # describe '#intialize' do
  #   it 'creates a new order_class' do
  #     allow(order).to receive().and_return()
  #     expect(order_class).to receive(:new)
  #     subject.add_to_order(quantity,item)
  #   end
  # end

  describe '#add_to_menu' do
    it {should respond_to(:menu_class)}
  end

  describe '#add_to_order' do
    it 'creates a new order class if last order complete' do
      subject.add_to_order(1,"venison sushi")
      subject.checkout(2.5)
      expect(order_class).to receive(:new).with(quantity,item)
      subject.add_to_order(quantity,item)
    end
  end

  describe '#show_order' do
    it 'raises error if no order created' do
      allow(subject).to receive(:complete?).and_return(true)
      expect{subject.show_order}.to raise_error "No order created"
    end
  end

  describe '#checkout' do
    it 'raises error if balance not paid' do
      message = "Amount is not correct"
      allow(subject).to receive(:check_total).and_return(5)
      expect{subject.checkout(3)}.to raise_error message
    end
  end
end
