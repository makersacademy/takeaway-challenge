class Menu

  def list
    return_menu
  end



  private

  def return_menu
    @dishes = {
              Chicken:  2.00,
              Soup:     5.00,
              Lamb:     2.00,
              Rice:     3.25,
              Coke:     5.00,
              Beer:     7.00,
              Tea:      1.00
              }
  end
end
