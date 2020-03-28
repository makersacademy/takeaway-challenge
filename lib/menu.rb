class Menu
    def initialize(menu)
      @menu = menu
    end
    def look_at_menu
       @menu.each do |k,v|
          v = sprintf '%.2f' % v
          puts   "#{k}: £#{v}"
       end 
    end 
  end
