class Menu
    attr_reader :menuu
    def initialize
        
       @menu = {
            misosoup: 6,
            sashimi: 4,
            temaki: 7
        }
    end  

    def list_dishes
        @menu.each do |key, value|
            puts "#{key}:£#{value}"
        end 
    end
end