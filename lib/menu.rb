class Menu

  attr_reader :items
  def initialize(items)
    @items = items
  end

  def show_menu
    @items.each do |item|
      item.each do |k, v|
        "#{k}: £#{v}"
      end
    end
  end
end