class Dish

  attr_reader :name, :description, :price

  def initialize(params = {})
    @name = params[:name]
    @description = params[:description]
    @price = params[:price]
    @params = params
  end

  def keys
    %w(name description price)
  end

  def [](key)
    @params[key.to_sym]
  end

  def []=(key, value)
    @params[key.to_sym] = value
  end
end
