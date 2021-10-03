require 'send_sms'

describe SMS do
  it { is_expected.to respond_to(:send) }
end
