
class TakeAway

  def show_menu
    filename = "lib/menu.txt"
    File.open filename do |f|
      f.each { |line| puts line }
    end
  end

end
