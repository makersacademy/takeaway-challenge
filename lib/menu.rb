class Menu
  attr_reader :current_menu

  def current_menu
    @current_menu = {
      1 => ["RUSTICA MARGHERITA", 9.45],
      2 => ["LENTIL RAGU", 8.95],
      3 => ["GREEN GODDESS BROCCOLI SALAD", 10.95],
      4 => ["SPAGHETTI POMODORO", 7.95]
    }
  end

  def view
    current_menu.each do |num, dish|
      puts "#{num}. #{dish[0]} : £#{dish[1]}"
    end
  end
end
