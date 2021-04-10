require_relative 'dish'

class Menu
  attr_reader :dishes

  def initialize(*items)
    @dishes = items
  end

  def show
    @dishes.each do |dish|
      puts "#{dish.name} : #{dish.price}"
    end
  end

  def pick_dish(choice)
    on_menu?(choice)
    find_dish(choice)
  end


  private

  def find_dish(choice)
    @dishes.select { |dish| dish.name == choice }
  end

  def on_menu?(choice)
    fail "they don't serve this" if find_dish(choice) == []
  end


end