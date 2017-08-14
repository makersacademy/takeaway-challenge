require 'sendtext'

describe TwilioController do

  let(:client) { double :client }
  let(:twilio_class_double) { double :twilio_class, new: client }
  subject { described_class.new(twilio_class_double) }

  # before do
  #   subject.instance_variable_set(:@client, client)
  # end

  context '#send_text_message' do

    it 'sends a text' do
      message = ""
      expect(client).to receive_message_chain(:messages, :create)
      subject.send_text_message("message")
    end
  end

end

# let('menu') { double :menu, on_the_menu?: true }
# let('order') { double :order, add: true }
# let('messager') { double :messager, send_text: true }
# before do
#   allow(Order).to receive(:new) { order }
#   allow(Menu).to receive(:new) { menu }
#   allow(Messager).to receive(:new) { messager }
# end
