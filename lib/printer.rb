#prints menu

class Printer

  def print(hash)
    hash.each { |dish, price| p "%s: £%.2f" % [dish, price] }
  end

end
