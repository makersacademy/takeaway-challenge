require 'takeaway'

describe Takeaway do
  it { is_expected.to respond_to(:send_text) }

  subject { Takeaway.new("12345", "abcde") }

  describe '#new' do
    context 'when initialized with 2 arguments' do
      it 'has an sid' do
        expect(subject.account_sid).to eq "12345"
      end

      it 'has an auth token' do
        expect(subject.auth_token).to eq "abcde"
      end
    end
  end
  
end
