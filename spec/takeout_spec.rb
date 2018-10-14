require 'takeout'

describe TakeOut do

  describe '#show_menu' do
    it 'has a menu which shows item and price' do
      takeout = TakeOut.new
      expect(takeout.show_menu).to eq TakeOut::MENU
    end
  end

  describe '#process(order)' do
    it 'sends a text' do
      message_sender = spy('message_sender')
      takeout = TakeOut.new(message_sender)

      order = Order.new
      order.add_dish('pizza', 5)
      order.add_dish('chicken soup', 4)

      takeout.process(order)

      expect(message_sender).to have_received(:create).with({
        :from => '+441303720101',
        :to => '+44 7817 933608',
        :body => "Your $9.00 order will arrive in 1 hour."
      })
    end
  end

end
