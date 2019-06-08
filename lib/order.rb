class Order

  def initialize
    @choices = []
  end


  def get(index)
    all[index]
  end

  private

  def all
    @choices
  end



end