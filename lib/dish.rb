class Dish
  attr_reader :title, :price

  def initialize(args)
    @title = args.fetch(:title)
    @price = args.fetch(:price)
  end
end
