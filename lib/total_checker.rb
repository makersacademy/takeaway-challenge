class TotalChecker

  def initialize(total)
    @total = total
  end

  def check
    raise "Please check total again." if @total != 17.60
    true
  end

end
