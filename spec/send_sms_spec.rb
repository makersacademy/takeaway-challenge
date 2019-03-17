require "send_sms"

describe Sms do
  it { is_expected.to respond_to(:send) }
end
