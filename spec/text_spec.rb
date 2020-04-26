require 'text'

describe Text do
  subject { described_class.new }

  it { is_expected.to respond_to(:send_sms) }
end
