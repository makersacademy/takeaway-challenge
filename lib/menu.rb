class Menu

  attr_reader :list
  def initialize
    @list = []
  end

  def add_dish(item, price)
    @list << { item.intern => price }
  end

  def remove_dish(item)
    @list.reject! { |dish| dish.keys.include? item.intern }
  end

  def import_menu(menu_to_import)
    error1 = "Not in correct format (must be stored in an array)"
    raise error1 unless menu_to_import.is_a?(Array)
    error2 = "Not in correct format (items must be stored as hashes)"
    criteria1 = menu_to_import.all? { |e| e.is_a?(Hash) }
    raise error2 unless criteria1
    menu_to_import.each { |e| @list << e }
  end

  def display_list
    @list.each do |dish|
      puts "#{dish.keys[0]} ------- £#{dish.values[0]}"
    end
  end

end
