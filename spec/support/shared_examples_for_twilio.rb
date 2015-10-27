require 'twilio'

shared_examples_for Twilio do

  describe 'sending message' do
    let(:instance) {described_class.new}
    let(:client) {double(new: api_link)}
    let(:api_link) {double(messages: messages)}
    let(:messages) {double(create: nil)}

    before do
      instance.send_message(client,client,client)
    end

    it 'sends a message' do
      expect(messages).to have_received(:create)
    end
  end

end
