require 'sms'

describe SMS do	

	subject(:sms)	{SMS.new}
	let(:send_text)	{ double(:send_sms) }

	it 'delivers an order confirmation text' do
		expect{sms.send_text}.not_to raise_error
	end
end
