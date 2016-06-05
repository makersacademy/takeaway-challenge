class Message
  def generate
    "Thank you!\nYour order was succesfully placed at #{ get_time.strftime('%H:%M') }"
  end

  private

  def get_time
    Time.new
  end
end
