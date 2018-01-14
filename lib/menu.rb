class Menu

attr_reader :list

  MENU = {
    BANANA_BREAD: 5.50,
    GRANOLA_FRUITCOMPOTE_YOGHURT: 4.50,
    PORRIDGE_WITH_PEANUT_BUTTER_BANANA: 4.50,
    PORRIDGE_WITH_ROASTED_PINEAPPLE_COMPOTE: 5.25,
    CHIA_PUDDING: 5.75,
    BIRCHER_MUESLI: 4.95,
    PBJ_BAGEL: 4.75,
    CHOCOLATE_BANANA_PANCAKES: 5.50,
    SWEETCORN_FRITTERS: 6.50
    }

  def show
    p MENU
  end

  def includes?(item)
    @list = MENU
    @list.include?(item.to_sym)
  end

end
