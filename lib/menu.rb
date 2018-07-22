class Menu
  attr_reader :whiskies, :show
  
  def initialize(whiskies)
    @whiskies = whiskies
  end

  def show
    whiskies.map do |item, price|
      "%s £%.2f" % [item.to_s.capitalize, price]
    end.join(", ") # got these 2 lines from the exemplar video
  end

  def has_item?(item)
    !!whiskies[item] # the double !! returns a boolean value of true, instead of te current value of nil
  end
end
