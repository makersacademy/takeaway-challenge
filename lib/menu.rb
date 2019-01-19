class Menu

  attr_reader :list

  def initialize(list = { korma: 4, jalfrezi: 6, pilau: 2, naan: 2.50 })
    @list = list
  end

  def dish?(dish)
    @list.has_key?(dish.to_sym)
  end

end
