class Takeaway

  attr_reader :menu, :order, :total, :given_total

  def initialize
    @menu = {
      burger: 5.0,
      chips: 2.0,
      doughnut: 1.0
    }
    @total = 0
    @order = []
    @given_total = 0
  end

  def show_menu
    @menu.each do |k, v|
      puts "--- #{k} : #{v} ---"
    end
  end

  def add_item(name,quantity = 1)
    quantity.times { @order << name }
    quantity.times { @total += @menu[name.to_sym]}
  end

  def check_total

    @order.each do |name|
      @given_total += @menu[name.to_sym]
    end
    compare_totals

  end

  private

    def compare_totals
      raise "sum does not match" if given_total != @total
      puts "Your order is confirmed and on its way"
    end
end
