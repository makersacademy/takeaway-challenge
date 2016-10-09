class Menu

attr_reader :dishes

    def initialize
      @dishes = {'pasta' => 12.5,
                 'pizza' => 8,
                 'chow mein' => 3.5,
                 'curry' => 10,
                 'pho' => 6.5,
                 'falafel' => 5,
                 'shawarma' => 7.5}
    end

    def valid_item(item)
      fail 'Item unavailable' unless @dishes.has_key? item
    end

    def price(item)
      @dishes[item]
    end

end
