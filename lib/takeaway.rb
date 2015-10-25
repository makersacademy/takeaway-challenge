class Takeaway

  def initialize(dishes)
    @dishes = dishes
  end

  def list_dishes
    list = ""
    @dishes.each_with_index do |dish, index|
      num, name, price = (index + 1).to_s, dish.name, dish.price.to_s
      line = three_col_line(num, name, price)
      list << line
    end
    list
  end

  private

  def three_col_line(str1, str2, str3)
    str1.ljust(10) + str2.ljust(20) + str3.rjust(6) + "\n"
  end


end
