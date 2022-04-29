require "dishes"

describe Dishes do

  it "Creates an new instance of Dishes" do
    expect(Dishes.new).to be_an_instance_of(Dishes)
  end

  it "Shows menu of dishes" do
    dishes = {"Avocado On Toast" => 5.50, 
      "Poached Egg On Toast" => 5.00, 
      "Sliced Banana On Toast" => 4.50, 
      "Jam On Toast" => 4.50, 
      "Peanut Butter On Toast" => 5.50,
      "Scrambled Eggs On Toast" => 5.00,
      "Greek Yoghurt + Strawberries on Toast" => 6.50}

    expect(subject.show_menu).to eq(dishes)
  end

end
