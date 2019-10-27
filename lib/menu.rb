class Menu
  def initialize(menu)
    @list = menu
  end

  def print
    @list.each do |k, v|
      puts "#{k.capitalize}: #{v}"
    end
  end

  def on_menu?(item)
    @list.include?(item)
  end
end
