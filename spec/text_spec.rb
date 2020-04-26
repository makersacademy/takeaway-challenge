require 'text'

describe Text do
  subject(:text) { described_class.new }
  let(:phone) { 07123123123 }
  let(:body) { double() }

  context '#sent text' do
    it 'should pass message to cusstomer' do
      expect{ text.sms(phone, body) }.to output.to_stdout
    end

  end

end