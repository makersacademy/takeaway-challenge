require 'money'

class Takeaway

  attr_reader :order
  Money.locale_backend = nil 
  Money.rounding_mode = BigDecimal::ROUND_HALF_UP

  def initialize
    @list_dishes = { "fish" => 500,
                     "sausage" => 600,
                     "chips" => 100,
                     "scampi" => 200
    }
    @order = []
  end

  def list_dishes
    @list_dishes.each { |key,val| puts "#{key}-#{in_gbp(val)}" }
  end

  def choose(*selections)
    selections.each { |selection| @order << selection }
  end

  def total
    (@order.map &get_prices).reduce(:+)
  end

  private 
  
  def in_gbp(amount)
    Money.from_cents(amount, "GBP").format
  end

  def get_prices
    Proc.new { |x| @list_dishes[x] }
  end
end
