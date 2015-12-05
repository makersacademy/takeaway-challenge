class Menu

#attr_reader :dishes

  def list
    menu_list
  end


  private

  def menu_list
    @dishes = {
            Lamb_curry: 4.00,
            Chicken_curry: 4.50,
            Prawn_curry: 5.00,
            Boiled_rice: 1.70,
            Pilau_rice: 2.00,
            Plain_naan: 1.50,
            Cobra: 3.50,
            Coke: 1.00
    }
  end

end
