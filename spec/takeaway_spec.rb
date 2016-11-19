require 'takeaway'

#user interface for a takeaway order system

describe Takeaway do

  subject(:takeaway) {described_class.new(menu_klass, order_klass)}
  let(:menu_klass) {double :menu_klass, new: menu}
  let(:menu) {double :menu, print: print_list, list: menu_list}
  let(:print_list) {"Curry £9"}
  let(:menu_list) {{"Curry" => 9}}
  let(:order) {double :order}
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
      expect(subject.order).to receive(:add)
      subject.add("Curry",1)
    end

  end

end
