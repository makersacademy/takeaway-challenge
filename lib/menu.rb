require_relative 'dish'
require_relative 'order'
require_relative 'sms'

class Menu

  require 'csv'

  attr_reader :current_order, :list

  def initialize
    @list = []
    load_menu
  end

  def view_menu
    @list.each { |item|
      puts "#{item[:number]}. #{item[:name]} - £#{item[:price]}"
      puts "#{item[:description]}"}
    return
  end


  def load_menu (filename = 'menu.csv')
    CSV.foreach(filename) do |line|
      number, name, description, price, type = line
      @list << {:number => number.to_i, :name => name, :description => description, :price => price, :type => type}
    end
  end

end
