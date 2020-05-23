
class Menu

  def initialize(*arg)
    @menu = arg
  end

  def show_dishes
    @menu.each do |item|
      puts "#{item.name}: #{formatted(item.price)}"
    end
  end

  def check(poss_item)
    @menu.each { |item| return true if poss_item == item.name }
    false
  end

  private

  def formatted(number)
    return "£%.2f" % number
  end


end
