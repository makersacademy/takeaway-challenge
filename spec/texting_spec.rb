require 'texting'

describe SmsText do
  it { is_expected.to respond_to(:send_text) }

  describe '#send_text' do

    subject(:text) { described_class.new }

    it "Should send txt" do
      # expect(text).to receive(:send_text)
      allow(text).to receive(:init_msg).with(anything)
      expect { text.send_text }.to_not raise_error
    end

  end
end
