require 'sms'

describe Sms do
  subject(:sms) {described_class.new}

  it {is_expected.to respond_to :send_sms}
end
