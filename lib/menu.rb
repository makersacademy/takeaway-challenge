class Menu

  attr_reader :dishes

  def initialize
    @dishes = import_dishes
  end

  def dishes
     @dishes.clone
  end

  private

  def import_dishes
    full_menu = {
      :vegetable_soup => 5.5,
      :ham_hock => 7.0,
      :gravalax => 7.5,
      :stilton_pie => 13.5,
      :duck_confit => 16.0,
      :italian_sausage => 13.5,
      :fish_n_chips => 13.5,
      :sea_bass => 16.0,
      :cheeseburger => 12.5,
      :apple_crumble => 6.5,
      :chocoloate_brownie => 6.5
    }
  end

end
