require 'messaging'
# require 'twilio-ruby'

describe Messaging do
  # describe 'construct message' do
  #   it 'print message correctly' do
  #     expect(subject.message).to eq "Thank you! Your order was placed and will be delivered before #{Time.now}"
  #   end
  # end

  describe 'send message' do
    it 'sends message with no error' do
      expect{subject.send}.not_to raise_error
    end
  end

end
