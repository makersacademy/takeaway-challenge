require 'text'
describe Text do
  let(:text) { described_class.new }

  describe '#send' do
    it 'confirms the message sent' do
      expect{text.send}.to change{text.message_sent}.from(nil).to(Text::DEFAULT_MESSAGE)
    end

    # it 'returns the message sent' do
    #   expect{tex}
    # end
  end
end
