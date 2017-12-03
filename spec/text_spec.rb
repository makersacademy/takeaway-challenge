# require 'text'
#
# describe Text do
#
#   subject(:text) { described_class.new }
#   subject(:mock_time) {double(:mock_time, (Time.new + 60 * 60).strftime("%H:%M"))}
#
#   describe "#send_text" do
#     before do
#       allow(text).to receive(:send_text)
#     end
#
#     it "sends a text message with order confirmation" do
#       expect(text.send_text).to receive(:send_text).with("Order successful. Estimated delivery time 19:00")
#     end
#   end
#
#   describe "#order_summary" do
#     it "should confirm the order with a delivery time" do
#     expect(subject.order_summary).to eq "Thank you for your order. The estimate delivery time is #{mock_time}"
#     end
#   end
# end


# it "sends a text message with order confirmation" do
#   # text.send_sms
#   expect(text.send_text).to receive(:send_text).and_return("Order successful. Estimated delivery time 19:00")
# end
