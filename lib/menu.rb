class Menu

  attr_reader :dishes

  def initialize (dishes = { bao: 4,
        spinach: 2,
        kimchi: 2,
        dumplings: 3,
        beer: 4,
        sake: 5,
        tea: 3 })
    @dishes = dishes
  end

  def view_menu
    index = 1
    str = ""
    dishes.each do |item, price|
      str += "#{index}. #{item.capitalize}......£#{price} "
      index += 1
    end
    str
  end

end
