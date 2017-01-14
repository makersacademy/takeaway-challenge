#prints menu to a terminal window
module MenuPrinter
  def self.to_string(menu)
    menu.each_with_index{|item, index| item_to_string item, index}.join("/n")
  end
  def self.item_to_string item, index
    index       = (index.to_s + ".").ljust(4)
    name        = item.name.ljust(15)
    description = item.description.ljust(40)
    pounds      = item.price.to_s[0..-3]
    pence       = item.price.to_s[-2..-1]
    "#{index} #{name} #{description} £#{pounds}.#{pence}"
  end
end
