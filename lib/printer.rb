#prints menu

class Printer

  def print(menu)
    menu.each {|k,v| p "#{k}: £#{v}"}
  end

end
