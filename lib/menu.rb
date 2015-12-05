class Menu

#attr_reader :dishes

  def list
    menu_list
  end


  private

  def menu_list
    @dishes = {
            Lamb_curry: {Price: 4, Quantity: 20},
            Chicken_curry: {Price: 4.50, Quantity: 20},
            Prawn_curry: {Price: 5, Quantity: 20},
            Boiled_rice: {Price: 1.75, Quantity: 20},
            Pilau_rice: {Price: 2, Quantity: 20},
            Plain_naan: {Price: 1.50, Quantity: 20},
            Cobra: {Price: 3.50, Quantity: 20},
            Coke: {Price: 1, Quantity: 20}
    }
  end

end
