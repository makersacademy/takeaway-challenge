require 'confirmation'

describe Confirmation do
  it 'can provide a expected delivery time' do 
    expect(subject.expected_delivery_time).to_not be_nil
  end

  describe '#send_sms' do
    let(:test_subject) { instance_double('confirmation', sms_sent: false) }

    it 'sends a text to customer when order is placed' do
      allow(test_subject).to receive(:send_sms).and_return(true)
      expect(test_subject.send_sms).to eq true
    end
  end
end
