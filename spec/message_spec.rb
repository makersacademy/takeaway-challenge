# require 'message'

#   describe Message do
#   subject(:message) {described_class.new(number)}
#   let(:number) {double :number}
#   let(:client) {double :client}
#   context 'Setting up the text message to send' do
#     describe '#initialize' do
#       it 'accepts the phone number' do
#         expect(message.number).not_to be_nil
#       end
#     end
#   end

#   context 'Sending the text message' do
#     describe '#send_text' do
#       it 'sends a text message' do
#         message.send_text(client)
#         expect(message.msg_sent).to be_true
#       end
#     end
#   end
# end