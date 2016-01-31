require_relative 'order'

class Basket

attr_reader :selection, :menu_choice

  def initialize(selection=[], menu_choice= ItalianMenu.new(:dinner, :all).dishes)
    @selection = selection
    @menu_choice = menu_choice
  end

  def price_up

    #will eventually be private
  end



  # def review_order
  #
  #
  # end

private

  # def send_order
  #   (will link to messaging)
  # end


end
