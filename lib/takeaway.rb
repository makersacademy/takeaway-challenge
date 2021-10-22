require "menu"

class Takeaway

    def menu 
        Menu.new
    end

    def dishes
        menu.each { |item, price| puts "#{item}, price: #{price}£" }
    end
    
end