# Takeaway class

class Takeaway

  def initializer(menu='TonysPizzaMenu.csv')
    @menu = menu
  end

  def show_menu
    file = File.open(@menu, "r")
    file.readlines.each do |line|
    number, name, price = line.chomp.split(",") #parallel assignment
    pretty_menu(number, name, price)
    end
    file.close
  end

  private
  def pretty_menu(number, name, price)
    pretty_menu = Array.new
    pretty_menu << {:number => number, :name => name, :price => price}
    return pretty_menu
  end

end
