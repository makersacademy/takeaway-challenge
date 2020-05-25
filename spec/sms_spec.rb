require_relative '../lib/sms'

describe SMS do
  let(:text) { described_class.new("1234", "abc123", "+77") }
  
  context "#initialize" do
    it 'should initialize with an account_sid' do
      expect(text.account_sid).to eq("1234")
    end

    it 'should initialize with auth_token' do
      expect(text.auth_token).to eq("abc123")
    end

    it 'should initialize with a phone_number' do
      expect(text.phone_number).to eq("+77")
    end
  end

end