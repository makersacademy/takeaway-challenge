require 'Time'
require 'Timecop'


describe Order do
  let(:order) {described_class.new}
  let(:cart) {double :cart}
  let(:selected_dish) {{:name => "Vindaloo", :price => 8, :quantity => 2}}
  let(:message_sender) {double :message_sender, :send_message => "Confirmation text sent"}
  let(:order_id) {order.object_id}



  describe '#total' do
    it 'should create a total price based on the quantity of dishes ordered' do
      allow(cart).to receive(:basket).and_return(selected_dish)
      allow(cart).to receive(:checkout).and_return(order.summary << (cart.basket))
      expect(order.total).to eq(16)
    end
  end

  describe '#print_order' do
    it 'should allow users to see a list of the dishes they have selected and the total price' do
      allow(cart).to receive(:basket).and_return(selected_dish)
      allow(cart).to receive(:checkout).and_return(order.summary << (cart.basket))
      expect {order.print_order}.to output("You have ordered:\nVindaloo @£8 x2\nThe total is £16\n").to_stdout
    end
  end

  describe '#confirm' do

    it 'should allow the user to confirm their order' do
      allow(order).to receive(:confirmed).and_return(true)
      allow(order).to receive(:gets).and_return("Y\n")
      expect{order.confirm}.to output("You have ordered:\nThe total is £0\nConfirm order? (Y/N)\nThank you for confirming your order.\n").to_stdout
    end

    it 'should raise an exception if the user does not confirm their order' do
      allow(order).to receive(:confirmed).and_return(false)
      allow(order).to receive(:gets).and_return("N\n")
      expect{order.confirm}.to raise_error("Cannot confirm order: user confirmation required.")
    end

  end

  describe '#send' do

    it 'allows the user to send their confirmed order and get a confirmation message' do

      allow(order).to receive(:confirmed?).and_return(true)
      allow(order).to receive(:notify).and_return("Confirmation text sent")
      expect(order.send).to eq ("Confirmation text sent")

    end

  end

end
