require 'messenger'

describe Messenger do
  describe 'environment variables' do
    it 'has an account id' do
      expect(subject.account_id.length).to eq(34)
    end

    it 'has an auth token' do
      expect(subject.account_auth.length).to eq(32)
    end

    it 'has a source phone number' do
      expect(subject.source_number.length).to eq(12)
    end

    it 'has a target phone number' do
      expect(subject.target_number.length).to eq(13)
    end
  end
end
