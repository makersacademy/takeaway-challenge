require_relative 'menu'

class MenuItem

  attr_reader :name, :description, :price, :category

  def initialize(item)
    @name = item[:name]
    @description = item[:description]
    @price = item[:price]
    @category = item[:category]
  end

end
