require_relative '../lib/sms'

describe SMS do
  let(:text) { described_class.new("1234", "abc123", "+77") }
  
  context "#initialize" do
  
    it 'should initialise with an account_sid' do
      expect(text.account_sid).to eq("1234")
    end

  end

end