require 'sms'

describe SMS do

  subject(:sms) { described_class.new }
  let(:client) { double(:client) }
  let(:messages) { double(:messages) }

  it { is_expected.to respond_to(:send_text) }

end
