require 'sms'

describe Sms do	

	subject(:sms)		{Sms.new}
	let(:send_sms)		{ double(:send_sms) }

	it 'delivers a confirmation SMS' do
		expect{sms.send_sms}.not_to raise_error
	end

end