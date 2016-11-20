require 'sms'

describe SMS do

	subject(:sms) { described_class.new }
	let(:delivery_time) { double(:delivery_time) }

	  it 'sends a text message' do
	    expect(sms).to receive(:send).with(5.99)
	    sms.send(5.99)
	  end

end