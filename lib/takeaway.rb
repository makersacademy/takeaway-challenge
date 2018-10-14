class Takeaway

attr_accessor :basket
  def initialize
    # @basket = {}
    # @basket = Hash.new{|hsh,key| hsh[key] = [] }
    @basket = []

  end

  def c_menu
    # @new_menu = {
    # "rice" => 1.20,
    # "fried_rice" => 2.10,
    # "chicken curry" => 4.50,
    # "Beef Ho Fun" => 6.40
    # }
    @new_menu = [
    {"item" => "rice", "price" => 1.20, "qty" => 1, "sub total" => 1.20},
    {"item" => "fried_rice", "price" => 2.10, "qty" => 1, "sub total" => 2.10},
    {"item" => "chicken curry", "price" => 4.10, "qty" => 1, "sub total" => 4.10},
    {"item" => "Beef Ho Fun", "price" => 5.10, "qty" => 1, "sub total" => 5.10}
    ]
  end

  def l_menu
    # @new_menu
    @new_menu.map {|x| x.values[0..1]}
  end

  def add_to_basket(item)

    @menu = @new_menu.find {|x| x['item'] == item }

    if @basket.find {|x| x['item'] == item }
      @current = @basket.find {|x| x['item'] == item }
      @current['qty'] = @current['qty'] + 1
      @current['sub total'] =  @menu['price'] * @current['qty']
       else
         @basket << @new_menu.find {|x| x['item'] == item }
    end
  end

  def basket_contents
    #@basket.find {|x| x['item']
    @basket
  end


end
