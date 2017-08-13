require 'sms'

describe SMS do
  describe '.send' do
    context 'method call' do
      specify {
        expect(subject).to respond_to(:send)
      }
    end
  end
end
