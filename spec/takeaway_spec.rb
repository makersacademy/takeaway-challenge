require 'takeaway'

describe TakeAway do
  default_menu = { 'pizza' => 6.99, 'chips' => 1.50, 'burger' => 3 }

  let(:menu) { double :Menu, :menu_items => default_menu }
  let(:order) { double :Order }
  let(:messenger) { double :Messenger }

  subject(:takeaway) { described_class.new(menu: menu, order: order, messenger: messenger) }

  describe '#show_menu' do

    it 'Calls menu_items method on Menu class' do
      expect(menu).to receive(:menu_items)
      takeaway.show_menu
    end

    it 'Shows the menu' do
      expect(takeaway.show_menu).to eq(default_menu)
    end

  end

  describe '#add_to_order' do

    it 'Accepts 1 argument' do
      expect(takeaway).to respond_to(:add_to_order).with(1).arguments
    end

    it 'Accepts 2 arguments' do
      expect(takeaway).to respond_to(:add_to_order).with(2).arguments
    end

    it 'Calls add_items method on Order class' do
      expect(order).to receive(:add_items)
      takeaway.add_to_order('Pizza')
    end

  end

  describe '#order_summary' do
    it 'Calls order_summary method on Order class' do
      expect(order).to receive(:order_summary)
      takeaway.order_summary
    end
  end

  describe '#total' do
    it 'calls total method on Order class' do
      expect(order).to receive(:total)
      takeaway.total
    end
  end

  describe '#checkout' do
    it 'calls checkout on Order class' do
      allow(messenger).to receive(:send_text)
      expect(order).to receive(:checkout)
      takeaway.checkout(13.98)
    end

    it 'calls send_text on Messenger class' do
      allow(order).to receive(:checkout)
      expect(messenger).to receive(:send_text)
      takeaway.checkout(13.98)
    end
  end

end
