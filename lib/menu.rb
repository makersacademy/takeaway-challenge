class Menu

  def initialize 
    @menu = items
  end

  def items 
    {
      :pasta => 6,
      :pizza => 10,
      :ramen => 7,
      :soup => 3 
    }
  end

  def print_menu
    puts "Tom's Takeaway-"
    @menu.each do |k, v|
      puts "#{k}:" + "............£#{v}"
    end
  end

end
