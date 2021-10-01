class Menu
  @@MenuList = {"spring roll"=>0.99, "char sui bun"=>3.99, "pork dumpling"=>2.99, "peking duck"=>7.99, "fu-king fried rice"=>5.99}
  
  def self.displayMenu
    list = ""
    @@MenuList.each{|item, price| list += "#{item}: #{price}\n"}
    return list
  end

  def self.containsItem(item)
    return @@MenuList[item] != nil
  end
end