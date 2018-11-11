module TimeMethods

  def time_of_order
    @order_time = Time.now
  end

  def delivery_time
    @delivery_time = time_of_order + 3600
  end

end
