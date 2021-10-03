require 'sms'

describe SMS do

  it { is_expected.to respond_to(:send_text) }

end
