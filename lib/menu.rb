class Menu

attr_reader :dishes

    def initialize
      @dishes = {'pasta': 12.5,
                 'pizza': 8,
                 'chow mein': 3.5,
                 'curry': 10,
                 'pho': 6.5,
                 'falafel': 5,
                 'shawarma': 7.5}
    end

end
