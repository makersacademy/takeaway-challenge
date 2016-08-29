class Menu

attr_reader :list

  def initialize
    @list = {Margerita: 5,
            Napolitan: 7,
            Pepperoni: 9}
  end

  def show_list
    puts "Pizza options are "
    list.each {|k,v| puts "#{k}: £#{v}"}
  end

  def on_menu?(item)
    fail "Not on the menu" if !@list.include?(item.to_sym.capitalize)
    true
  end

end
