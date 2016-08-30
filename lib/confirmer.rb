require_relative 'texter'

class Confirmer

  def initialize(texter = Texter.new)
    @texter = texter
  end

  def check
    puts "Are you happy with your order?"

    options = ["yes","no"]
    choice = gets.chomp
    while !options.include?choice
      puts "Please answer by yes or no"
      choice = gets.chomp
    end

    choice == "yes" ? @texter.send_confirmation : "Your order has been cancelled"

    "Thank you"

  end

private

attr_reader :texter

end