require 'terminal-table'

class Menu

  attr_reader :dishes

  def initialize options
    @dishes = options[:dishes]
  end

  def view_dishes
    view = ''
    dishes.each do |item, price|
      view << "#{item} price:£#{price}\n"
    end
    view
  end
end




