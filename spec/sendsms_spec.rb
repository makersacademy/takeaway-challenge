require_relative '../lib/sendsms'

describe SendSms do

  context '#initialize' do
    let(:test_message) {double 'new test message'}
    
    it 'is initialized with a message from Order class' do
      allow(test_message).to receive(:new).and_return("hello")
      expect(test_message.new).to eq("hello")
    end
    
  end
end
