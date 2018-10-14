require 'takeout'

describe TakeOut do

  describe '#show_menu' do
    it 'has a menu which shows item and price' do
      takeout = TakeOut.new
      expect(takeout.show_menu).to eq TakeOut::MENU
    end
  end

  describe '#process(order)' do
    it 'sends a confirmation text when order is valid' do
      message_sender = spy('message_sender')
      takeout = TakeOut.new(message_sender)

      order = Order.new
      order.add_dish('icecream', 3)
      order.add_dish('chicken soup', 5)

      takeout.process(order)

      expect(message_sender).to have_received(:create).with({
        :from => '+441303720101',
        :to => '+44 7817 933608',
        :body => "Your $8.00 order will arrive in 1 hour."
      })
    end

    it "does not send text when order contains an item not in the menu" do
      message_sender = spy('message_sender')
      takeout = TakeOut.new(message_sender)
      order = Order.new
      order.add_dish('invalid-item', 39)

      expect { takeout.process(order) }.to raise_error("Invalid order")
      expect(message_sender).not_to have_received(:create)
    end

    it "does not send text when an order item doesn't match the menu price" do
      message_sender = spy('message_sender')
      takeout = TakeOut.new(message_sender)
      order = Order.new
      order.add_dish("icecream", 999)

      expect { takeout.process(order) }.to raise_error("Invalid order")
      expect(message_sender).not_to have_received(:create)
    end

  end

end
