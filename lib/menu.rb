class Menu
  attr_reader :list
    
  def initialize
    @list = {
          croissant: 2,
          panini: 4,
          coffee: 3,
          tea: 3,
          juice: 3.5
    }
  end
  
  def show
    @list.each do |key, value|
      puts "#{key}: £#{value}"
    end
    
    @list
  end

end