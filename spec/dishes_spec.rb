require "dishes"

describe Dishes do

  it "Creates an new instance of Dishes" do
    expect(Dishes.new).to be_an_instance_of(Dishes)
  end

  it "Shows menu of dishes" do
    dishes = ["Avocado On Toast", 
      "Poached Egg On Toast", 
      "Sliced Banana On Toast", 
      "Jam On Toast", 
      "Peanut Butter On Toast",
      "Scrambled Eggs On Toast",
      "Greek Yoghurt + Strawberries on Toast"]

    expect(subject.show_menu).to eq(dishes)
  end

end
