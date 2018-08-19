require 'messager'

describe Messager do
  subject(:messager) { described_class.new }

  it "knows its ID" do
    expect(messager.account_sid).to eq('AC9c21a11caf4a1045f79f695742aae881')
  end

  it "knows its authorisation token" do
    expect(messager.auth_token).to eq('a2669f5218a3e8f29703184280a528f7')
  end

  describe "#send_eta_text" do
    it "sends text" do
      allow(messager).to receive(:send_eta_text)
      expect(messager).to receive(:send_eta_text)
      messager.send_eta_text
    end
  end
end
