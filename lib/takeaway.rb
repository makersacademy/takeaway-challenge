class Takeaway

  attr_reader :menu, :total, :args

  def initialize
    @menu = {"half_chicken" => 10, "butterfly_chicken" => 10, "chips" => 3, "rice" => 3}
  end

  def view_menu
    menu
  end

  def select *args
    @args = args
    @total = 0
    @args.each do |arg|
      @total += menu[arg]
    end
    verify
  end

  def verify
    "You ordered: #{args.join(", ").to_s}. The total is #{total}."
  end

end
