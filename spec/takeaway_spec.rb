require 'takeaway'

describe Takeaway do

  subject(:takeaway) {described_class.new(menu: menu, order: order_klass, sms: sms)}
  let(:menu_klass) {double :menu_klass, new: menu}
  let(:menu) {double :menu, print: printed_list, list: menu_list}
  let(:printed_list) {"Chicken £3.50, Burger £4.90"}
  let(:menu_list) {{"Curry" => 9, "Burger" => 8}}
  let(:order_klass) {double :order_klass, new: order}
  let(:order) {double :order, total: 17}
  let(:sms_klass) {double :sms_klass, new: sms}
  let(:sms) {double :sms, send: nil}

  before do
    subject.begin_order
  end


  describe '#view_menu' do
    it 'prints the menu to the screen' do
      expect(subject.view_menu).to eq printed_list
    end
  end

  describe '#begin_order' do

    it 'creates a new order' do
      expect(subject.order).to eq order
    end

  end

  describe '#add' do

    it 'adds items to the order' do
      expect(subject.order).to receive(:add)
      subject.add("Curry",1)
    end

  end

  describe '#place_order' do

    it '#raises error if price is incorrect' do
      allow(order).to receive(:total).and_return(17)
      expect{subject.place_order(18)}.to raise_error 'Price is incorrect'
    end

    it '#sends confirmation sms if price is correct' do
      allow(order).to receive(:total).and_return(17)
      expect(sms).to receive(:send)
      subject.place_order(17)
    end

  end

end
