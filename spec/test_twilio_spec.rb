# =begin
require 'spec_helper'

feature 'twilio confirmation message' do
  scenario 'user receives order confirmation sms' do
    VCR.use_cassette('twilio order confirmation') do
      visit root_path
      fill_in 'twilio order confirmation from', with: 'order was placed'
      expect(current_path).to eq(twilio_request_message_success_path)
    end
  end
end

# =end
