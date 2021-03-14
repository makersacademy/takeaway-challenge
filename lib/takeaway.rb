class Takeaway

  TAKEAWAY_MENU = { quesidilla: 5,
                    burrito: 7,
                    taco: 3,
                    churros: 2 }

  def initialize(takeaway_menu = TAKEAWAY_MENU)
    @takeaway_menu = takeaway_menu
  end

  def list_menu
    @takeaway_menu
  end
end
