class Menu

  def list
    return_menu
  end



  private

  def return_menu
    @dishes = {
              Chicken: 4,
              Soup:    2,
              Lamb:    5,
              Rice:    3,
              Coke:    1,
              Beer:    1.5,
              }
  end
end
