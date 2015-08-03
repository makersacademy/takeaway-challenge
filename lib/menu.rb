module Menu

  def menu
    
    @takeaway_menu.each do | item, price |
        puts "#{item}: £#{price}"
    end
  end
end
