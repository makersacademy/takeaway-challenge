class Dish

  attr_reader :name, :description, :price

  def initialize(params = {})
    @name = params[:name]
    @description = params[:description]
    @price = params[:price]
  end

  def to_s
    "#{name}     #{description}           #{price}"
  end
end
