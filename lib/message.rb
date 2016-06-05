class Message
  def generate(total = 0)
    "Thank you! Your order came to £#{ total }. " +
    "Our baristas are new, so expect your drinks at " +
    "#{ get_delivery_time.strftime('%I:%M%P') }"
  end

  private

  def get_delivery_time
    Time.new + 3600
  end
end
