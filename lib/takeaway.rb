class Takeaway

  attr_reader :menu, :order

  def initialize
    @menu =
    {
      'curried chips' => 4.99,
      'smoked duck with marmite' => 9.99,
      'anchovies and ketchup' => 6.75,
      'lardons, toast and haddock' => 1.99,
      'capers, ox tongue and mayonnaise' => 3.99
    }
    @order = []
  end

def show_menu
  @menu
end

def select(item)
  @order << item
end

def check_total
  
end

def send_text

end

end
