require 'sms'

describe Sms do
  subject(:sms) { described_class.new }
  let(:client) { double(:client) }

  it 'delivers SMS with estimated time of delivery' do
    sms.deliver
  end

end
