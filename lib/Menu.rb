class Menu
  @@MenuList = {"spring roll"=>0.99, "char sui bun"=>3.99, "pork dumpling"=>2.99, "peking duck"=>7.99, "fu-king fried rice"=>5.99}
  
  def self.displayMenu
    @@MenuList.each{|item, price| puts "#{item}: #{price}"}
  end
end