class Order

  def initialize
    @summary = []
  end

  def add dish
    @summary << dish
  end

  def summary
    @summary.dup
  end
end
