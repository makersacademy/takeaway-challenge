# for testing purposes so that texts do not get triggered

class FakeTextMessage
  attr_reader :confirmed

  def paid(payment)
    eta = (Time.now + (60*60)).strftime("%H:%M")
    puts "FAKE TEXT: Your payment of £#{'%.2f' % payment} has been accepted.
    Your food should be with you by #{eta}. Enjoy your meal"
    @confirmed = "PAID"
  end

end
