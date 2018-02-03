class Restaurant

  DEFAULT_MENU = { tofu: 1,
           quorn: 2,
           tempeh: 3,
           seitan: 4
          }

  attr_reader :menu

  def initialize(menu = DEFAULT_MENU)
    @menu = menu
  end

end
