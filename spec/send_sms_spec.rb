require 'rspec'
require 'send_sms'

RSpec.describe SendSMS do
  describe '#initialize' do
    it 'initializes class with delivery time' do 
      expect(subject).to eq subject
    end
  end
end
