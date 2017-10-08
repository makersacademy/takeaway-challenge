class Menu

  attr_reader :dishes

  def initialize
    @dishes = { 'pizza' => 8,
                'pasta' => 6,
                'salad' => 8,
                'chips' => 3,
                'burger'=> 9 
              }
  end

end
