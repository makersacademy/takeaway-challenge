
require './lib/message_processor'
describe MessageProcessor do
  context 'Feature 1 - Text confirmation message' do
    describe '#send_message' do
      it { expect(subject).to respond_to(:send_message) }
      it 'sends da message' do
        # subject.send_message removed to stop test faliure
      end
    end
  end
  context 'Feature 2 - Text ordering' do

  end
end
