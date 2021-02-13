module DishLister

  def list_dishes
    @dishes.each { |dish| puts "#{dish[:name]}, £" + "%.2f" % dish[:price] }
  end

end
