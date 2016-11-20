require 'sms'

describe Sms do

  subject(:sms) { described_class.new }
  let(:client) { double :client }

  # it "can send a confirmation text" do
  #   message = 'Thank you for your order'
  #   expect(sms).to eq 'Thank you for your order'
  # end

end
