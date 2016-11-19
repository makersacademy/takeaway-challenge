require 'takeaway'

#user interface for a takeaway order system

describe Takeaway do

  subject(:takeaway) {described_class.new(menu_klass, order_klass)}
  let(:menu_klass) {double :menu_klass, new: menu}
  let(:menu) {double :menu, print: print_list, list: menu_list}
  let(:print_list) {"Curry £9"}
  let(:menu_list) {{"Curry" => 9, "Burger" => 8}}
  let(:order) {double :order, total: 17}
  let(:order_klass) {double :order_klass, new: order}


  describe '#view_menu' do
    it 'prints the menu to the screen' do
      expect(subject.view_menu).to eq print_list
    end
  end

  describe '#begin_order' do

    it 'creates a new order' do
      subject.begin_order
      expect(subject.order).to eq order
    end

  end

  describe '#add' do

    it 'adds items to the order' do
      subject.begin_order
      expect(subject.order).to receive(:add)
      subject.add("Curry",1)
    end

  end

  describe '#check_price' do

    it 'returns true if price matches sum of dishes in order' do
      subject.begin_order
      allow(order).to receive(:total).and_return(17)
      expect(subject.price_correct?(17)).to eq true
    end

    it 'returns false if price does not match sum of dishes in order' do
      subject.begin_order
      allow(order).to receive(:total).and_return(17)
      expect(subject.price_correct?(18)).to eq false
    end






end

end
