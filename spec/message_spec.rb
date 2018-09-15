require 'message'

describe Message do

  context 'implementing texts regarding delivery' do

    it "checks to see takeaway use Twilio API" do
      expect { subject }.not_to raise_error
    end

    it "checks if SID is accurate" do
      expect(Message::SID).to eq ENV['TWILIO_ACCOUNT_SID']
    end
  end

end