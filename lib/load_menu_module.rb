module LoadMenu

  private

  def load_menu(filename)
    menu_hash = {}
    file = CSV.read(filename)
    file.each do |item, price| 
      menu_hash[item] = price
    end
    @menu_hash = menu_hash
  end
end
