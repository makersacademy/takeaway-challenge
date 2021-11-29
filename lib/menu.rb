class Menu
  def initialize(*args)
    @dishes = args
  end

  def view_menu()
    output_str = ""
    @dishes.each{ |dish|
      output_str << "#{dish.name}: £#{sprintf('%.2f', dish.price)}\n"
    }
    return output_str
  end
end