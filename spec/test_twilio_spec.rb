=begin
feature 'twilio confirmation message' do
  scenario 'user receives order confirmation sms' do
    VCR.use_cassette('twilio order confirmation') do
      visit_root_path
      fill_in 'twilio order confirmation from', with: 'XXX'
      expect(current_path).to eq(twilio_request_message_success_path)
    end
  end
end

=end
