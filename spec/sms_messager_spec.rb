require "sms_messager.rb"

describe SMSMessager do

  subject(:sms_messager) { described_class.new }

  it { is_expected.to respond_to(:message).with(1).argument }


end
