require "bundler"
Bundler.require()

$sms_allowed = false
$account_sid = ""
$auth_token = ""
$to = ""
$from = ""

def send_confirmation_text(body)
  if $sms_allowed
    @client = Twilio::REST::Client.new($account_sid, $auth_token)
    @client.messages.create(to: $to, from: $from, body: body) if body.class == String
  end
  sms_incomplete_warning
end

def check_sms_details
  $sms_allowed = true unless $account_sid == "" || $auth_token == "" || $to == "" || $from == ""
  sms_incomplete_warning
end

def sms_incomplete_warning
  puts "WARNING: sms details incomplete, unable to send texts." if $sms_allowed == false
end
check_sms_details
