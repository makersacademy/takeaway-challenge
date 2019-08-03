class Menu

    def initialize(dishes_list = [])
      @dishes_list = dishes_list
    end

    def show
      @dishes_list.map {|dish| "#{dish.name} - £#{dish.price}\n"}.join("")
    end

end