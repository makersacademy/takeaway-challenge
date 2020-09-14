class Takeaway
  def initialize
    @selected_dishes = selected_dishes
  end
  def select_dishes(selected_dishes)
    @selected_dishes << selected_dishes

  end
end