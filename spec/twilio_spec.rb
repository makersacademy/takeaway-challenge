# Code written by coach Ed during the challenge review workshops
# on Monday 15 Jan 2018.
#
# require './lib/twilio.rb'
#
#
# describe Texter do
#   describe '#send' do
#     # has to communicate with twilio
#     # 1. test the method chain
#     # 2. test the correct arguments to create ()
#     # 3. test return value or test puts
#
#     # let(:) = setting double that can be used in all tests
#
#     it 'calls the correct methods' do
#       texter = Texter.new
#       #calling doubles within a test
#       client_messages = double('client messages', create: "a message") #nil instead of a "a message"
#       client_instance = double('a client instance', messages: client_messages)
#       twilio_client = double('a twilio client', new: client_instance)
#
#       expect(twilio_client).to receive(:new)
#       expect(client_instance).to receive(:messages)
#       expect(client_instance).to receive(:create).with_arguments(hash_including(:from, :to, :body)
#
#       texter.send("HELLO", twilio_client) #passing double
#     end
#   end
# end
