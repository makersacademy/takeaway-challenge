class Menu

  def access
    upload
  end

  private

  def upload
    menu = {}
    File.open("./lib/menu.txt").each_line do | line |
    key, value = line.chomp.split(",")
    menu[key] = value
    end
    menu
  end
end