require 'restaurant'

describe Restaurant do
  let(:order) { double :order, add: nil }
  let(:order_klass) { double :order_klass, new: order }
  let(:menu) { double :menu, display: nil }
  let(:sms) { double :sms }
  subject(:restaurant) { described_class.new(menu, order_klass, sms) }

  describe '#read_menu' do
    it 'displays the menu' do
      expect(restaurant.read_menu).to eq menu.display
    end
  end

  describe '#order' do
    it 'creates new order instance' do
      expect(order).to receive(:add).and_return(nil)
      restaurant.order :pizza
    end
  end

  before(:each) { restaurant.order :pizza }

  describe '#remove' do
    it 'removes dish from order' do
      expect(order).to receive(:remove).and_return(nil)
      restaurant.remove :pizza
    end
  end

  it 'shows order' do
    expect(order).to receive(:show_basket).and_return(nil)
    restaurant.show_order
  end

  it 'order_total' do
    expect(order).to receive(:total).and_return(nil)
    restaurant.order_total
  end

  before(:each) do
    allow(order).to receive(:total).and_return(nil)
    allow(sms).to receive(:message).and_return(nil)
  end

  describe '#checkout' do
    it 'sends message to order' do
      expect(order).to receive(:complete_order).and_return(nil)
      restaurant.checkout 50
    end
  end

  describe '#order_log' do
    it 'shows history of orders' do
      allow(order).to receive(:complete_order).and_return(nil)
      restaurant.checkout 50
      expect(restaurant.order_log).to include order
    end
  end
end
