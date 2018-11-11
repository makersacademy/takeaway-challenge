require 'order'

describe Order do

  selection = [["chicken korma", 5.7], ["king prawn dhansak", 7.7], ["garlic naan", 2.75], ["chicken korma", 5.7], ['peshwari naan'], 3.00]

  let(:menu)  { double(:menu, selection: selection) }
  let(:order) { described_class.new(menu.selection) }

  describe '#initialize' do
    it 'accepts a basket as an argument' do
      selection = [["chicken korma", 5.7], ["king prawn dhansak", 7.7], ["garlic naan", 2.75]]
      menu = double(:menu, selection: selection)
      order = Order.new(menu.selection)
      expect(order.basket).to eq selection
    end

    it 'sets the order total at 0 by default' do
      expect(order.total).to eq Order::DEFAULT_TOTAL
    end

    it 'creates an empty final bill' do
      expect(order.final_bill).to be_empty
    end
  end

  # need to create test to repond to text output
  describe '#show_order' do
    xit 'shows the user the items, quantities and total price of the order' do
      selection = [["chicken korma", 5.7], ["garlic naan", 2.75], ["pilau rice", 2.0], ["chicken korma", 5.7]]
      menu = double(:menu, selection: selection)
      order = Order.new(menu.selection)
      expect(order.show_order).to eq "chicken korma quantity: 2 price: 11.4
      garlic naan quantity: 1 price: 2.75
      pilau rice quantity: 1 price: 2.0
      total: 16.15"
    end
  end

  # need to over ride sending of actual text whence left pending
  describe '#confirm' do
    xit 'confirms order to send text' do
      selection = [["chicken korma", 5.7], ["garlic naan", 2.75], ["pilau rice", 2.0], ["chicken korma", 5.7]]
      menu = double(:menu, selection: selection)
      order = Order.new(menu.selection)
      order.show_order
      send_sms = double(:send_sms, send_text_message: "message sent")
      expect(send_sms).to respond_to :send_text_message
      # order.confirm!
    end
  end
end
