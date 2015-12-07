class Menu

  def list
    menu_list
  end

  private

  def menu_list
    @dishes = {
            Lamb_curry: 4.00,
            Chicken_curry: 4.50,
            Vegetable_curry: 5.00,
            Onion_bhaji: 1.70,
            Plain_rice: 2.00,
            Plain_naan: 1.50,
            Biryani_rice: 3.50,
            Coke: 1.00
    }
  end
end
