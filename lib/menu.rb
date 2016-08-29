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

end
