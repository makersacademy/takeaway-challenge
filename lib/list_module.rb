module List
  def list(data, message)
    data.each_with_index do |dish, i|
      puts "#{i+1}: " + message
    end
  end
end
