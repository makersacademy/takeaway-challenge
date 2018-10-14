require 'text'

describe Text do

		it 'sends a confirmation text' do
				expect { subject.send_sms }.not_to raise_error
		end
end
