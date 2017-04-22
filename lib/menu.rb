class Menu

  MENU = {mystery_chicken: 4, barrys_special_rice: 2, chow_mein: 3, dumplings: 3, pan_galactic_gargle_blaster: 314159, crispy_duck: 2, chish_n_fips: 1, spring_rolls: 2}

  attr_reader :menu

 def initialize
   @menu = MENU
 end

 def read_menu
   p @menu
 end

end
