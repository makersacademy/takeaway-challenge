module List
  def list_dishes(data)
    data.each_with_index do |dish, i|
      puts "#{i+1}: #{dish[:name]} costs #{dish[:price]}"
    end
  end
end
