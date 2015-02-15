require 'messenger'
require 'takeaway'

describe Messenger do 

let(:takeaway) [Takeaway.new]
let(:messenger) {double :messenger}

	it 'sends a text message once the order is confirmed' do
		messenger.stub(:confirmation).and_return('a confirmation text has been sent!')
  	expect(messenger).to receive(:confirmation)
  	takeaway.send_sms
	end

	# it 'should know the time an hour from now'
	

	# end


end