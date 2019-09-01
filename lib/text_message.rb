class TextMessage
  def send_text
    print "Thank you! Your order was placed and will be delivered before"
    print " #{Time.now.hour + 1}:#{Time.now.strftime('%M')}"
  end
end
