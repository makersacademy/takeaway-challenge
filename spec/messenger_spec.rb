require 'messenger'

describe Messenger do
  it 'should send confirmation via SMS/Twilio' do
    stub_request(:post, "https://api.twilio.com/2010-04-01/Accounts/#{ENV['TWILIO_ACCOUNT_SID']}/Messages.json").
         with(
           body: { "Body" => "Thank you! Your order was placed and will be delivered before #{(Time.now + 60 * 60).strftime("%H:%M %d-%m-%Y")}", "From" => ENV['FROM_PHONE'], "To" => ENV['TO_PHONE'] },
           headers: {
          'Accept' => 'application/json',
          'Accept-Charset' => 'utf-8',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Authorization' => 'Basic QUM5MTdjZmI3ZDM3NGUyMDVjZDgyZjAwMDBiYzQ4NTljNTo2MjVkY2MxZThiOGM5MjI1NDE0ZTRkZGZiOTUwNWQ0ZA==',
          'Content-Type' => 'application/x-www-form-urlencoded',
          'User-Agent' => 'twilio-ruby/5.23.0 (ruby/x86_64-darwin18 2.6.0-p0)'
           }).
         to_return(status: 200, body: "", headers: {})
    expect { subject.confirm(ENV['TO_PHONE']) }.not_to raise_error
  end
end
