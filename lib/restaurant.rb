class Restaurant

  WAIT_TIME = 3600 # in seconds

  def place(order)
    @order = order
    deadline = wait.strftime('%H:%M')
    message = "Thank you! Your order was placed and will be delivered before #{deadline}"
  end

  private

  def wait
    wait_time = WAIT_TIME + Time.now.to_i
    wait = Time.at(wait_time)
  end
end
