require 'messenger'

describe Messenger do
  describe 'environment variables' do
    it 'has an account id' do
      expect(subject.account_id.length).to eq(34)
    end

    it 'has an auth token' do
      expect(subject.account_auth.length).to eq(32)
    end
  end
end
