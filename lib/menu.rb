class Menu

  def initialize(list = { korma: 4, jalfrezi: 6, pilau: 2, naan: 2.5 })
    @list = list
  end

  def list
    @list
  end

  def has_dish?(dish)
    @list.has_key?(dish.to_sym)
  end

end