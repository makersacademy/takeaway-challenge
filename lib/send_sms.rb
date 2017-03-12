require 'twilio-ruby'

module SMS

  def hex_to_bin(s)
    s.scan(/../).map { |x| x.hex.chr }.join
  end

  def send
    phone = phone_request.gsub!(/^0/, "44")
    account_sid = "#{hex_to_bin('41433536366534663736333866346531316136356665373761363661613762343233')}"
    auth_token = "#{hex_to_bin('3537636238356135306432643663623037663332653034386662353830323133')}"

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create(
      from: "#{hex_to_bin('343431313333323036313833')}",
      to: "#{phone}",
      body: "Thank you! Your order was placed and will be delivered before #{(Time.new + 3600).strftime('%H:%M')}"
    )
    nil
  end
end
