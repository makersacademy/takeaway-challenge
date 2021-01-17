require 'twilio-ruby'

require_relative "./lib/menu"
require_relative "./lib/takeaway"

MENU = Menu.new("./menu.json")

account_sid = ENV["ACCOUNT_SID"]
auth_token = ENV["AUTH_TOKEN"]
API_CLIENT = Twilio::REST::Client.new(account_sid, auth_token)

TAKEAWAY = Takeaway.new(MENU, API_CLIENT)

loop do
  TAKEAWAY.prompt
  puts "\n"
end
