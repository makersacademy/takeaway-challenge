Dish = Struct.new(:dish, :price) do
  def is_selected?
    @selected == true
  end

  def format
    "#{dish}, £#{'%.2f' % price}"
  end

  def selected
    @selected = true
  end

  def deselect
    @selected = false
  end
end
