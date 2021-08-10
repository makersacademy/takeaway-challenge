class Menu

  attr_reader :items
  def initialize(items)
    @items = items
  end

  def show_menu
    i = 0
    while i < @items.length
      @items[i].each do |k, v|
        puts "#{i + 1}. #{k}: £#{v}"
      end
      i += 1
    end
  end
end
