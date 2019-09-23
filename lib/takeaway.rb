require_relative 'menu'

class Takeaway

  def list_dishes
    MENU_ITEMS.each_with_index do |(name, price), index|
      puts "#{index + 1}. #{name} - #{price}"
    end
  end
end
  