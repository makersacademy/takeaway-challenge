require 'customer'
require 'diner'

describe Customer do
  #  let (:subject){ double: customer }

  context '#view_menu' do
    it 'is able to view the menu' do
      expect(subject).to respond_to(:view_menu).with(1).argument
    end
  end

  context '#order_items' do
    it 'is able to specify items for an order' do
      expect(subject).to respond_to(:order_items).with(2).arguments
    end

    it 'increments the total after items are specified' do
      subject.view_menu
      subject.order_items(4, "Pizza")
      expect(order_total).to eq 12.00
    end

    it 'calls finalize_order' do
      expect(subject).to receive(:order_confirm)
      subject.order_confirm
    end
  end

end
