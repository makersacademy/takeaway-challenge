class Print

  def print_dishes(dishes)
    dishes.each do |key, value|
      print "#{key.to_s.capitalize}, £#{value}\n"
    end
  end

end
