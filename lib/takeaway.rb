class Takeaway

  attr_reader :menu

  def initialize
    @menu = {:salad => 1, :soup => 2, :chicken => 4, :fish => 3, :water => 1}
  end

  def order(*args)
  #   *args.each do |item|
  #     if @menu.includes?(item)

  end
end
