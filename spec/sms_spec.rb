require 'sms'

describe SMS do
  subject(:sms)          { described_class.new }
  # let(:order)            { double :order, basket: [{"spring rolls"=>3.99}, {"spring rolls"=>3.99}]}

  it "knows its ID" do
    expect(sms.account_sid).to eq('AC9c21a11caf4a1045f79f695742aae881')
  end

  it "knows its authorisation token" do
    expect(sms.auth_token).to eq('a2669f5218a3e8f29703184280a528f7')
  end

  describe "#send_msg" do
    it "replies with eta one hour" do
      # order = Order.new
      expect(sms).to receive(:send_msg).and_return("your order will arrive at #{Time.now.hour + 1}:#{Time.now.min}")
      sms.send_msg
    end
  end
end
