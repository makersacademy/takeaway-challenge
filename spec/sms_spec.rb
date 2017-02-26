require 'sms'

describe SMS do

  subject(:sms) { described_class.new }

  it { is_expected.to respond_to(:send_text) }


end
