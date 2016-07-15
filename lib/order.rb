class Order

  def initialize(menu: Dishes.new)
    @menu = menu
  end

  def show_menu
    menu
  end

  def select_dishes(id:, quantity:)
  end

  def confirm_total(total_amount:)
    total_amount
  end

  private
  attr_reader :menu


end
