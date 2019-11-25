require 'takeaway'

describe Takeaway do
  let(:menu) { double :menu }
  let(:order) { double(:order, summary: "summary", total: 13, update_order: nil) }
  let(:order_class) { double(:order_class, new: order) }
  let(:messenger) { double(:messenger, send_message: nil) }
  let(:phone_number) { '+2334342' }

  subject(:takeaway) { described_class.new(menu, order_class, messenger) }

  context "when placing an order" do
    before :each do
      allow($stdin).to receive(:gets).and_return("y\n", phone_number)
      allow($stdout).to receive(:write)
    end

    it "should start an order with the menu" do
      expect(order_class).to receive(:new).with menu
      takeaway.run
    end

    it "should confirm the order is correct by printing the summary" do
      regex = Regexp.quote(order.summary)
      expect { takeaway.run }.to output(/#{regex}/).to_stdout
    end

    it "should ask for user input to confirm the order is correct" do
      expect($stdin).to receive(:gets).and_return("y\n")
      takeaway.run
    end

    it "should update the order if it is not correct" do
      allow($stdin).to receive(:gets).and_return("n\n", "n\n", "y\n")
      expect(order).to receive(:update_order).twice
      takeaway.run
    end

    it "should try to send a message once the order is confirmed" do
      body = "Thank you! Your order was placed and will be delivered before "
      body << (Time.now + 3600).strftime('%H:%M')
      expect(messenger).to receive(:send_message)
        .with(phone_number, body)
      takeaway.run
    end
  end
end
