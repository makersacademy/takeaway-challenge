require_relative 'confirmer'
class Cashier

  def initialize(confirmer = Confirmer.new)
    @confirmer = confirmer
    @total = 0
  end


  def checks_order (menu, selection)

    line_width = 20
    puts ""

    puts "Your order".rjust(line_width/2)

    selection.each do |meal,quantity|
      puts (quantity.to_s + " x " + meal).ljust(line_width)
      puts ("£"+(quantity*menu[meal]).to_s).rjust(line_width)
    end


    selection.each do |meal,value|
    selection[meal] = value * menu[meal]
    end

    @total = selection.values.inject(0){|sum,price| sum + price}
    puts ""

    puts("Total".ljust(line_width/2) + ("£"+@total.to_s).rjust(line_width/2))
    confirmer.check(@total)
  end

private

attr_reader :confirmer

end
