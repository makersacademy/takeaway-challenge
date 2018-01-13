class Takeaway

  MENU = {
    "tuna soaked nut butter" => 2.00,
    "sweaty eel sausage" => 2.50,
    "microwaved xmas crab" => 4.00,
    "easy peasy hot & eely cheesy balls" => 3.50,
    "Kenny Loggins' mackeral tagine" => 9.00,
    "chubby tea bags" => 2.00,
    "mushed tadpole burrito" => 6.00,
    "cod monsieur" => 6.50,
    "steamy bream hot box" => 6.00,
    "fishy goods and services" => 7.00,
    "muddy fish-finger aeoli" => 3.00,
    "hot pollacks" => 4.00,
    "scaley protein shake" => 3.00,
    "freaky lamp fish" => 6.00
  }

  def viewmenu
    MENU.each { |key, value| puts "#{key}, £#{value}0" }
  end

end
