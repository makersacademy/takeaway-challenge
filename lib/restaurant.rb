class Restaurant
attr_accessor :menu

  def initialize
    @menu = {}
  end

  def menu
    @menu.each do |k,v|
      puts "#{k}: £#{v}"
    end
  end

end
