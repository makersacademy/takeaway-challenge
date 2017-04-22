require 'CSV'
class List

  def view_items(file="takeawaylist.csv")
    CSV.open(file, "w") do
    end
  end

end
