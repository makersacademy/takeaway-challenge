class Menu

  def display_menu
    load_menu
  end

private

  def load_menu
    menu = {}
    File.open("menu.txt").each_line do | line |
    key, value = line.chomp.split(",")
    menu[key] = value
    end
    menu
  end
end