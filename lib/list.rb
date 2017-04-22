require 'CSV'
class List

  def view_items(file="takeawaylist.csv")
    CSV.foreach(file) do |row|
      build_menu_item(row)
    end
  end

end
