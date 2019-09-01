require 'text_message'
require 'sms'
describe TextMessage do
  describe '#send_text' do
    it "sends a text message to user" do
      expect { subject.send_text }.
      to output("Thank you! Your order was placed and will be delivered before #{Time.now.hour + 1}:#{Time.now.strftime('%M')}").to_stdout
    end
  end

  # describe '#sms_send' do
  #   it "should asign parameters and delegate to send_sms"
  #   # it { should delegate_method(:deliver).to(:post_office).as(:ship) }
  # end
end
