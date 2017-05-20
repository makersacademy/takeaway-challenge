class Menu

  attr_reader :dishes, :prices

  def initialize # extract to require json file
    @dishes = { :starters => { "Olives" => 4, "Pitta bread" => 5 }, :main_course => { "Fried duck" => 12, "Fish & Chips" => 9 }, :dessert => { "Jam roll" => 5, "Apple crumble" => 6 } }
  end

  def lists_dishes_with_prices # line too long
    "Starters: #{extracts_starters} -- Main Course: #{extracts_main_course} -- Dessert: #{extracts_dessert}."
  end

  private

  def extracts_starters # refactor to avoid repetition
    @dishes[:starters].map { |k, v| "#{k} = £#{v}" }.join(', ')
  end

  def extracts_main_course
    @dishes[:main_course].map { |k, v| "#{k} = £#{v}" }.join(', ')
  end

  def extracts_dessert
    @dishes[:dessert].map { |k, v| "#{k} = £#{v}" }.join(', ')
  end

end
