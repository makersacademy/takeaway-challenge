# require "delivery.rb"
#
# describe Delivery do
#   let(:client) {double :client}
#   subject { described_class.new(client) }
#
#   it "responds to test" do
#     expect(subject).to respond_to(:send_message).with(1).argument
#   end
#   it "calls messages on twilio client" do
#     expect(client).to receive(:messages)
#     subject.send_message("345")
#   end
#   it "calls creates on twilio" do
#     allow(client).to receive(:messages)
#   end
#
# end
