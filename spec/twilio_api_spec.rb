require "twilio_api"

describe TwilioAPI do

  subject( :twilio ){ described_class.new( account_sid, auth_token, t_phone_number ) }
  let( :account_sid ){ double :account_sid }
  let( :auth_token ){ double :auth_token }
  let( :t_phone_number ){ double :twilio_phone_number }

  context "#send_text" do
    it { is_expected.to respond_to( :send_text ).with(2).argument }

  end

end
