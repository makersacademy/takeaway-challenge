class Menu

  attr_reader  :dishes

  def initialize
    @dishes = { naan: 100, daal: 300, rice: 200 }
  end


  private

  def not_on_menu?(item)
    fail "Item not on menu" unless @dishes.key?(item)
  end

end
