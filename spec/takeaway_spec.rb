require 'takeaway'

describe Takeaway do
  let(:dish1) { double :dish, name: 'soup', price: 4 }
  let(:dish_view) { double :dish_view, display: "dishes" }
  let(:menu) { double :menu }
  let(:menuview_class) { double :menuviewclass, new: "menu view" }
  let(:order) { double :order, item_list: [[dish1, 1]] }
  let(:order_view) { double :order_view, display: 'order view' }
  let(:order_view_class) { double :order_view_class, new: order_view }
  let(:order_factory) { double :order_factory, create_order: order }
  let(:order_factory_class) { double :order_factory_class, new: order_factory }
  let(:order_array) { [['soup', 1]] }
  subject { described_class.new(menu, menuview_class, order_factory_class, order_view_class) }
  before(:each) { allow(Kernel).to receive(:puts).and_return(nil) }

  context 'display menu' do
    describe '#display_menu' do
      it 'shows a list of dishes with prices' do
        expect(menuview_class).to receive(:new).with(menu)
        subject.display_menu
      end
    end
  end

  context 'ordering' do
    describe '#place_order' do
      it 'place an order by giving the list of names of the items and quantities' do
        expect(order_factory_class).to receive(:new)
        subject.place_order(order_array)
      end
    end

    describe '#display_order' do

      it 'displays the order with total' do
        subject.place_order(order_array)
        expect(order_view_class).to receive(:new).with(order)
        subject.display_order
      end
    end
  end


end
