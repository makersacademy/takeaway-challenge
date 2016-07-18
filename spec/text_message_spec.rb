require 'text_message'

describe TextMessage do

  subject(:message) { described_class.new }
  let(:confirmation) { double (:confirmation)}

  it {is_expected.to(respond_to(:message))}

 describe '#message' do
   it 'triggers the Twilio message code' do
     expect(message).to(receive(:send_message))
     message.message(confirmation)
   end
 end

end
