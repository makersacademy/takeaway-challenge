class Menu
  attr_reader :whiskies, :show
  
  def initialize(whiskies)
    @whiskies = whiskies
  end

  def show
    whiskies.map do |item, price|
      "%s £%.2f" % [item.to_s.capitalize, price]
    end.join(", ") # got this from the exemplar video
  end
end
