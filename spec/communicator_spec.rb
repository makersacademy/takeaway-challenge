require 'communicator'

describe Communicator do
  subject(:communicator) { described_class.new }

  describe '#send' do
    it 'sends an SMS using the twilio API' do
      VCR.use_cassette('twilio') do
        communicator.send 10.20
      end
    end
  end
end
