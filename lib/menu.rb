

module Menu

  MENU = [{item: 'burger', price: '5.50'}, {item: 'chips', price: '1.50'}]

  def Menu.list
    MENU.map { |item| "#{item[:item]}: #{item[:price]}"}
  end

end
