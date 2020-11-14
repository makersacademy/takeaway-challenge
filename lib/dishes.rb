class Dishes

  def initialize
    @list = [ "fish £6",
            "chicken £7",
             "curry £5",
             "pizza £4",
             "vegetarian £3"]
  end

  def create_list
    @list.join (" , ")
  end
end
