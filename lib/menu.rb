require_relative 'add_delete'

class Menu
  include AddDelete

  def initialize(dishes = [])
    @dishes = dishes
  end

  def dishes
    @dishes.dup
  end

  def add(*dishes)
    add_all(dishes, @dishes)
  end

  def delete(*dishes)
    delete_all(dishes, @dishes)
  end

  def view
    puts "~~~Menu~~~"
    dishes.uniq.each do |dish|
      puts info(dish)
    end
  end

  private
  def info(dish)
    "#{dish}, £#{dish.price}"
  end

  # These override relevant module methods so they apply to a menu
  def add_message(item)
    "Added #{item}"
  end

  def delete_message(item)
    "Deleted #{item}"
  end

  def error_message(item)
    "Error: menu does not contain #{item}."
  end

end
