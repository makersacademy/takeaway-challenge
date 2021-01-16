class Menu
    def initialize
        @dishes = ['Ramen - £1.99']
    end

    def list
        @dishes.each { |dish| puts dish }
    end
end