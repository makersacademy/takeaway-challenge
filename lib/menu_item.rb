class MenuItem
  attr_reader :name, :description, :price
  def initialize initial_hash
    @name        = initial_hash[:name]
    @price       = initial_hash[:price]
    @description = initial_hash[:description]
    raise "name required to add menu_item" if name.nil?
    raise "price required for #{name}" if price.nil?
  end
end
