require "bill"

describe Bill do

  subject(:bill) { described_class.new }

  # describe "#send_bill" do
  #   it "sends sms to customer" do
  #     time = Time.now + 3600
  #     expect(bill).to receive(:send_bill).with("Thank you! Your order was placed and will be delivered before #{time.strftime("%k:%M")}")
  #     bill.send_bill("Thank you! Your order was placed and will be delivered before #{time.strftime("%k:%M")}")
  #   end
  # end
end
