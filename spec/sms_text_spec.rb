require 'sms_text'

  describe Sms_Text do
    subject(:sms_text) { described_class.new }

    before do
      allow(subject).to receive(:send_text)
    end

  end
