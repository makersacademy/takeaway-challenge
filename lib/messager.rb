class Messager

  def send_text(message)
    Twilio::REST::Client.new(gets.chomp, gets.chomp)
      .messages.create(
        from: 441_874_202_012,
        to: 447_984_633_938,
        body: message
      )
  end
end
