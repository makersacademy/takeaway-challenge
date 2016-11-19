require 'takeaway'

#user interface for a takeaway order system

describe Takeaway do

  subject(:takeaway) {described_class.new(menu_klass, order_klass)}
  let(:menu_klass) {double :menu_klass, new: menu}
  let(:menu) {double :menu, print: menu_list}
  let(:menu_list) {"1. Green Curry £8"}
  let(:order) {double :order}
  let(:order_klass) {double :order_klass, new: order}

  describe '#view_menu' do
    it 'prints the menu to the screen' do
      expect(subject.view_menu).to eq menu_list
    end
  end

  describe '#begin_order' do

    it 'creates a new order' do
      subject.begin_order
      expect(subject.order).to eq order
    end

  end

  describe '#add_to_basket' do

    it 'raises an error if not a valid item number' do
      expect(subject.add_to_basket(2))
    end



    end








end
