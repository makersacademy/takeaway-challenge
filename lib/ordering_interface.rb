require "time"

class OrderingInterface

  HORRID_DISHES = {
    gelatinous_grime_goulash: 7,
    crispy_cockroach_croquettes: 8,
    reeking_rat_ravioli: 11,
    slug_slime_secretion_soup: 9,
  }

  def order(args_as_hash)
    raise "No total given!" unless !!args_as_hash[:total]
    given_total = args_as_hash[:total]
    args_as_hash.delete(:total)
    args_as_hash.keys.each { |dish|
      raise "Unknown dish!" unless HORRID_DISHES.keys.include? dish
    }
    calculated_total = args_as_hash.values.reduce { |acc, quant|
      acc + quant
    }
    raise "Total doesn't match!" unless calculated_total == given_total
    "Thank you! Your order was placed and will be delievered before #{Time.now.strftime('%H:%M')}."
  end  

  def menu
    HORRID_DISHES
  end

end