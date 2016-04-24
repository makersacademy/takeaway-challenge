require 'restaurant'

describe Restaurant do

  let(:order) {double(:order)}
  let(:menu) {double(:menu)}
  let(:messenger) {double(:messenger)}
  let(:order_class) {double(:order_class, new: order)}
  let(:menu_class) {double(:menu_class, new: menu)}
  let(:messenger_class) {double(:messenger_class, new: messenger)}
  # subject(:restaurant) {described_class.new(order_class: order_class)}

  let(:quantity) {double :quantity}
  let(:item) {double :item}

  describe '#intialize' do

    it 'creates a new order_class' do
      expect(subject.order_class).to receive(:new)
      subject.add_to_order(quantity,item)
    end

    it 'creates a new menu_class' do
      expect(subject.menu_class).to receive(:new)
    end

    it 'initializes a new messenger_class' do
      expect(subject.order_class).to receive(:new)
    end
  end
  
  describe '#add_to_menu' do
    it {should respond_to(:menu_class)}
  end


  describe '#add_to_order' do
    it 'creates a new order class if last order complete' do
      allow(subject).to receive(:check_total).and_return(0)
      expect(order_class).to receive(:new).with(quantity,item)
      subject.checkout(0)
      subject.add_to_order(quantity,item)
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
