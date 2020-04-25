class Restaurant
    
    attr_reader :menu
    
    def initialize
      @menu = {
          croissant: 2,
          panini: 4,
          coffee: 3,
          tea: 3,
          juice: 3.5
      }
    end
    
    def see_menu
      @menu
    end
    
end