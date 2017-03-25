require 'rubygems'
require 'twilio-ruby'

  account_sid = 'AC033ff5fd1ab50ecf84e702ae695c4053'
  auth_token = '74465a4227537a433741dd0749629b3a'
  client = Twilio::REST::Client.new account_sid, auth_token

  client.messages.create(
      from: ['+441256830268'],
      to: ['+447515356421'],
      body: "Here is the first message from Ruby!"
    )
