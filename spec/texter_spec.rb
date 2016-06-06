require 'texter'
describe Texter do
subject(:texter){described_class.new}

  describe '#send_confirmation' do
    it 'sends a confirmation' do
      twilio = double('twilio_client')
      expect(twilio).to receive(:create)

    end
  end

end