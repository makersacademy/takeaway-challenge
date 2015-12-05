class Menu

  def list
    return_menu
  end



  private

  def return_menu
    @dishes = {
              Chicken: {Price: 2.00, Qty: 10},
              Soup:    {Price: 5.00, Qty: 5},
              Lamb:    {Price: 2.00, Qty: 2},
              Rice:    {Price: 3.25, Qty: 20},
              Coke:    {Price: 5.00, Qty: 15},
              Beer:    {Price: 7.00, Qty: 12},
              }

  end
end
