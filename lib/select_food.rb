class SelectFood
  # GREETING = "Please select which dish you would like: "

  # attr_reader :greeting

  # def initialize
  #   @greeting = GREETING
  # end

  def user_choice
    puts "Please select which dish you would like: "
    @food = gets.chomp
    puts "How many of #{@type} would you like? "
    @quantity = gets.chomp
  end
end
