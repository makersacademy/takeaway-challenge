require 'csv'

class Menu

  def initialize(menu_csv)
    data = CSV.read(menu_csv, { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all})
    hashed_data = data.map { |d| d.to_hash }
    p hashed_data
  end

  def list
    {"Vegetable pie"=>2, "Lamb pie"=>3, "Steak pie"=>3, "Kangaroo pie"=>4, "Dog pie"=>1, "Monkey pie"=>5, "Whale pie"=>6}
  end

end
