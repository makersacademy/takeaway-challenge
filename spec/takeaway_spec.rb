require "takeaway"

describe Takeaway do
  subject(:takeaway) { described_class.new(menu, bill) }
  let(:menu) { double("menu") }
  let(:bill) { double("bill") }

  describe "#show_menu" do
    it "returns menu" do
      expect(menu).to receive(:show)
      takeaway.show_menu
    end
  end

  describe "#confirm_order" do
    it "sends sms to customer" do
      time = Time.now + 3600
      expect(bill).to receive(:send_bill).with("Thank you! Expect your order at #{time.strftime("%k:%M")}")
      takeaway.confirm_order
    end
  end
end
