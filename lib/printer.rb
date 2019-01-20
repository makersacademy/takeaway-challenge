class Printer

def self.prettify_menu(hashed_menu)
  @output = "Item name\t\tPrice\n"
  hashed_menu.each { |e| @output += "#{e[:item]}\t\t#{e[:price]}\n" }
  @output
end

end
