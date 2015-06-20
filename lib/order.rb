require_relative 'menu'

class Order

  def initialize (menu)
    @menu = menu.view
    @selection = {}
    @total = 0.0

  end

  def view_selection
    @selection.clone

  end

  def view_total
    copy = @total.to_s
    copy.to_f

  end

  def select pizza
    @selection[pizza] = @menu[pizza]
    @total += @menu[pizza]

  end

  def remove pizza
    @selection.delete(pizza)
    @total -= @menu[pizza]

  end

end


