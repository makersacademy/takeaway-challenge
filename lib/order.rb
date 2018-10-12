class Order

  def choose(items)
    choice = items.join(" and ") if items.is_a?(Array)
    "Great, you have selected #{choice}"
  end
end
