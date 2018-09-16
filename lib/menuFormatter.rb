class MenuFormatter

  def format(menu)
    menu.each do |item|
      puts "#{item[:dish]}, #{item[:price]}"
    end
  end
end
