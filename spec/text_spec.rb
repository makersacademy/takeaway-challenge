require 'text'
describe Text do
  let(:text) { described_class.new('+44123456') }

  describe '#send' do
    # CHECKED AND THIS TEST DOES SEND A TEXT GIVEN A VALI NUMBER
    xit 'sends a message when asked' do
      expect { text.send }.to change { text.message_sent }.from(false).to(true)
    end
  end
end
