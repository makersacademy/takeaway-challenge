require 'notification'

RSpec.describe Notification do
  describe '#send_message' do
    it 'responds' do
      expect(subject).to respond_to(:send_message).with(1).argument
    end
  end
end
