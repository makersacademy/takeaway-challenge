require 'order'


describe Order do
 subject(:order) {described_class.new}


  describe "#send" do
    it do
      expect(order).to receive(:send).with(1)argument("Thank you for your order, "\
      "It will be delivered by #{Time.now + (60 * 60)}")
    order.send

    end

  end
#stub out behaviour like weather in airport

end