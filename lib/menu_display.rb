# require_relative 'menu'
#
# class Menu_Display
#
#   attr_accessor :menu, :list
#
#   def initialize(menu = Menu)
#     @menu = menu
#   end
#
#   def show
#     @list = []
#     menu.loaded_menu.each.with_index do |item, index|
#       @list << "#{index + 1}. #{item[:name]}: #{item[:description]} £#{item[:price]}"
#     end
#     @list
#   end
# end
