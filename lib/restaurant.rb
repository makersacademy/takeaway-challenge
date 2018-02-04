class Restaurant

  DEFAULT_MENU = { tofu: 5.99,
           quorn: 7.99,
           tempeh: 6.49,
           seitan: 8.99
          }

  attr_reader :menu

  def initialize(menu = DEFAULT_MENU)
    @menu = menu
  end

end
