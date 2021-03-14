require 'order'

describe Order do
  let(:user) { double(:user, mobile: 12345) }
  let(:items) { double(:items) }
  let(:order) { described_class.new(user, items) }

  describe '#initialize' do
    it 'status should be "not processed"' do
      expect(order.status).to eq("not processed")
    end
  end

  describe '#confirm_order' do
    let(:messenger) { double(:messenger) }
    msg = "test message"
    it 'pass user mobile and msg to messenger' do
      expect(messenger).to receive(:send_sms).with(user.mobile, msg)
      order.confirm_order(messenger, msg)
    end

    it 'status should be "confirmed"' do
      allow(messenger).to receive(:send_sms).with(user.mobile, msg)
      order.confirm_order(messenger, msg)
      expect(order.status).to eq("confirmed")
    end
  end

end