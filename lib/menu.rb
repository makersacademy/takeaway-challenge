class Menu
  attr_reader :options

  def initialize

    @options = {
      sesame_prawn_toast: 5.79,
      crispy_seaweed: 3.99,
      spring_rolls: 2.99,
      lemon_chicken: 5.89,
      king_prawns_with_cashew_nuts: 6.99,
      steamed_rice: 4.00

    }
  end
  def view_menu

    self.options.each do |item, cost|
      puts "#{item.to_s.gsub('_', ' ').capitalize} £#{cost.to_s}"
    end
  end

end
