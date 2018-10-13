require 'text'

describe Text do
  let(:send_confirmation)	{ double(:send_confirmation) }

	it 'sends a confirmation text' do
		expect{subject.send_sms}.not_to raise_error
	end
end
