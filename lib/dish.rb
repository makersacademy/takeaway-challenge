Dish = Struct.new :name, :price, :selected do
  def set_selected
    self[:selected] = true
  end
end
