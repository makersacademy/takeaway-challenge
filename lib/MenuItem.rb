class MenuItem
  attr_reader :name, :description, :price
  def initialize initialization_hash
    @name        = initialization_hash[:name]
    @description = initialization_hash[:description]
    @price       = initialization_hash[:price]
  end
end
