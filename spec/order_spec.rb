require_relative '../lib/order.rb'
require_relative '../lib/menu.rb'

describe Order do

  attr_reader :menu, :order

  before :each do
    @menu = Menu.new
    @menu.add_item('Fish and chips', 3.20)
    @menu.add_item('Roast dinner', 4.00)
    @order = Order.new(menu)
  end

  describe '#initialize' do
    context 'accepts menu as argument when new instance is created' do
      let(:restaurant) { double('Restaurant') }
      it 'raises an error if argument is not an instance of Menu class' do
        expect { Order.new(restaurant) }.to raise_error('Please provide a valid menu!')
      end
      it 'raises an error if menu has no items' do
        expect { Order.new(Menu.new) }.to raise_error('The menu you have provided has no items!')
      end
    end
  end

  describe '#add_item' do
    it 'raises an error if item is not included in menu' do
      expect { order.add_item('Burger', 3) }.to raise_error('Please enter a valid dish!')
    end
    before :each do
      order.add_item('Roast dinner', 1)
    end
    it 'adds item to order' do
      expect(order.order.key?('Roast dinner')).to eq true
    end
    it 'updates quantity of item if already present in order' do
      order.add_item('Roast dinner', 1)
      expect(order.order['Roast dinner']).to eq 2
    end
    it 'returns with confirmation that item has been added to order' do
      expect(order.add_item('Fish and chips', 2)).to eq "Fish and chips x 2 has been added to your order."
    end
  end

  describe '#confirm_price' do
    it 'raises error if user entered price does not match value of order' do
      expect { order.confirm_price(1) }.to raise_error('Price does not match total value')
    end
    it 'confirms that order total is correct when user enters correct price' do
      order.add_item('Roast dinner', 1)
      expect(order.confirm_price(4)).to eq 'Order total is correct.'
    end
  end

  describe '#confirm_order' do
    let(:sms) { double(:sms) }

    it 'sends a confirm order request to SmsConfirmation class' do
      expect(sms).to receive(:send_message)
      order.confirm_order(sms)
    end
    before :each do
      allow(sms).to receive(:send_message)
    end
    it 'clears current order after confirmation' do
      order.add_item('Roast dinner', 1)
      order.confirm_order(sms)
      expect(order.order).to eq({})
    end
    it 'asks user to check phone for updates' do
      expect(order.confirm_order(sms)).to eq 'Please check your phone for order updates.'
    end
  end

  describe '#subtotal' do
    it 'returns subtotal value as a formatted string' do
      order.add_item('Roast dinner', 1)
      expect(order.subtotal).to eq "£4.00"
    end
  end
end
