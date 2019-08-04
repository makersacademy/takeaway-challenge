require_relative '../lib/sms_module'

class TestSms
  include SMS
end

TestSms.new.send_text("This is a test for my first twilio sms")