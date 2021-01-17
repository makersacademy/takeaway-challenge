require 'sms'

describe Sms do
    subject(:sms) { described_class.new(client: client)}
    let(:client) { double(:client)}
    it "delivers an SMS with an estimated time" do
        sms.deliver
    end
end
