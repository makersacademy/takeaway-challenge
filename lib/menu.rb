
module Menu_Print

  def show (menu)
    puts "Menu:"
    menu.each{|x,y| puts "#{x}. Price: £#{sprintf('%.2f', y)}"}
  end

end
