class Menu

  attr_reader :list
  def initialize
    @list = Hash.new
  end

  def add_dish(item, price)
    @list[item] = price
  end

  def remove_dish(item)
    @list.reject! { |k, _v| k == item }
  end

  def import_menu(menu_to_import)
    error1 = "Not in correct format (items must be stored as hashes)"
    # criteria1 = menu_to_import.all? { |e| e.is_a?(Hash) }
    raise error1 unless menu_to_import.is_a?(Hash)
    menu_to_import.each { |k, v| @list[k] = v }
  end

  def display_list
    @list.each do |k, v|
      puts "#{k} ------- £#{v}"
    end
  end

end
