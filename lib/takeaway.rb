require 'money'

class Takeaway

  attr_reader :order
  Money.locale_backend = nil 
  Money.rounding_mode = BigDecimal::ROUND_HALF_UP

  def initialize
    @list_dishes = { "fish" => in_gbp(500),
                     "sausage" => in_gbp(600),
                     "chips" => in_gbp(100),
                     "scampi" => in_gbp(200)
    }
    @order = []
  end

  def list_dishes
    @list_dishes.dup
  end

  def choose(*selections)
    selections.each { |selection| @order << selection }
  end

  private 
  
  def in_gbp(amount)
    Money.from_cents(amount, "GBP").format
  end
end
