class Menu

  attr_reader :dishes

  def initialize options
    @dishes = options[:dishes]
  end

  def view_dishes
    menu_view = ''
    dishes.each { | item, price | menu_view << "#{item} price:£#{price}\n" }
    menu_view
  end
end




