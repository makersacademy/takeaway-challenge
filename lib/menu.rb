class Menu

  attr_reader :items

  def list 
    @items = { 'small chips' => 2.00, 'large chips' => 3.00, 
      'dab' => 4.00, 'sole' => 4.50, 'vegan fishcake' => 2.50, 
      'vegan picked egg' => 1.50 }
  end 

  def show_menu
    list.each { |k, v| puts "#{k}: £#{v}" } 
  end

  def get_price(item)
    p list[item]
  end
end
