require 'order'
require 'menu'
require 'bill'

describe Bill do
  let(:menu) { Menu.new }

  describe "#pay" do
    it "Should let the user know what they've paid" do
      menu.order
      menu.my_order.add_to_order("Egg Fried Rice", 2)
      bill = Bill.new(menu.my_order)
      expect{ bill.pay }.to output("You've paid 3.0\n").to_stdout
    end
  end

  let(:client) { double :client, messages: double()}

  describe "#confirmation" do
    it 'Sends a confirmation text' do

      expect(client.messages).to receive(:create)

      menu.order
      menu.my_order.add_to_order("Egg Fried Rice", 2)
      bill = Bill.new(menu.my_order)
      bill.confirmation
    end
  end
end
