# to require or load
# require '~/Dropbox/makers_projects/makers_weekends/takeaway_challenge_we2-3/takeaway-challenge/lib/select_food.rb'
# load '~/Dropbox/makers_projects/makers_weekends/takeaway_challenge_we2-3/takeaway-challenge/lib/select_food.rb'

class SelectFood
  # GREETING = "Please select which dish you would like: "

  # attr_reader :greeting
  attr_reader :current_order
  attr_reader :current_choice

  def initialize
  #   @greeting = GREETING
    @current_order = []
  end

  def user_choice
    puts "Please select which dish you would like: "
    @food = gets.chomp
    puts "How many of '#{@food}' would you like? "
    @quantity = gets.chomp
  end

  def user_order
    2.times do
      user_choice
      @current_choice = {@food => @quantity}
      @current_order << @current_choice
    end
  end


end
