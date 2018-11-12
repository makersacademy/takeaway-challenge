require 'sms'

describe Sms do

  it { is_expected.to respond_to(:client).with(0).argument }

  describe '#send' do

    it 'should send an sms to confirm order' do

    end

  end

end
