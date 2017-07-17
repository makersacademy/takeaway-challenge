require 'confirmation'

describe Confirmation do
  subject(:text) { described_class.new }
  let(:account) { double(:account_sid) }
  let(:messages) { double(:auth_token) }
  let(:time) { double(:time_now) }
  let(:client) { double(:client, create: nil, sid: nil) }

  # describe "#sent_text" do
  #   it "responds to sent_text" do
  #     expect(text).respond_to(:sent_text)
  #   end
  #end

  it { is_expected.to respond_to(:sent_text) }
  # it { is_expected.to respond_to(:delivery_time) }

end
