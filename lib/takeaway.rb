class TakeAway

  attr_reader :menu

MENU = { hamburger: 4,
         hotdog: 3,
         pizza: 5,
         fried_chicken: 3
       }

  def view_dishes(menu = MENU)
    menu.map do |x, y|
      "#{x.to_s.split('_').join(' ').capitalize} £#{y}"
    end
  end

end

takeaway = TakeAway.new
puts takeaway.view_dishes
