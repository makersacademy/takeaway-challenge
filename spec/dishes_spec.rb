require "dishes"

describe Dishes do

  it "Creates an new instance of Dishes" do
    expect(Dishes.new).to be_an_instance_of(Dishes)
  end

  it "Shows menu of dishes" do
    dishes = [{ name: "Avocado On Toast", price: 5.50 }, 
      { name: "Poached Egg On Toast", price: 5.00 }, 
      { name: "Sliced Banana On Toast", price: 4.50 }, 
      { name: "Jam On Toast", price: 4.50 }, 
      { name: "Peanut Butter On Toast", price: 5.50 },
      { name: "Scrambled Eggs On Toast", price: 5.00 },
      { name: "Greek Yoghurt + Strawberries on Toast", price: 6.50 }]

    expect(subject.show_menu).to eq(dishes)
  end

end
