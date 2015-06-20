class Menu

  def initialize
    @menu = {pepperoni:  10.0,
             margherita:  6.0,
             mushroom:    7.0,
             vegetarian:  8.0,
             tandoori:   11.0,
             meat:       12.0}

  end


  def view

    @menu.clone

  end


end
