require 'menu'

describe Menu do

  describe "#initialize/new" do
    it "starts with an empy list of dishes" do
      expect(subject.dishes).to eq([])
    end

    it "starts with a default menu name" do
      expect(subject.name).to eq("MENU")
    end

    it "can be given a new menu name" do
      menu = Menu.new("JAVAU'S MENU")
      expect(menu.name).to eq("JAVAU'S MENU")
    end
  end

  describe "#add_dish" do
    it 'raises error when dish passed in does not respond to name' do
      expect{subject.add_dish('not_a_dish')}.to raise_error 'invalid dish'
    end

    it 'raises error when dish name is not a valid string' do
      dish = double(:dish, name: 11)
      expect{subject.add_dish(dish)}.to raise_error 'invalid name'
    end

    it 'raises error when dish passed in does not respond to price' do
      expect{subject.add_dish('not_a_dish')}.to raise_error 'invalid dish'
    end

    it 'raises error when dish pass has a none numerical price' do
      dish = double(:dish, name: "dish_name", price: "this is a joke")
      expect{subject.add_dish(dish)}.to raise_error 'invalid price'
    end

    it 'adds a dish to menu with passed dish-like object' do
      dish = double(:dish, name: "dish_name", price: 9.99)
      subject.add_dish(dish)
      expect(subject.dishes).to eq([dish])
    end
  end

  describe "#display" do
    it 'displays the current dishes on the menu with name and price' do
      dish1 = double(:dish, name: 'Egg Fried Rice', price: 3.95)
      dish2 = double(:dish, name: 'Singapore Noodle', price: 4.99)
      allow(dish1).to receive(:display_info).and_return(
      'Egg Fried Rice                          £   3.95')
      allow(dish2).to receive(:display_info).and_return(
      'Singapore Noodle                        £   4.99')
      subject.add_dish(dish1)
      subject.add_dish(dish2)
      expect(subject.display).to eq("                       MENU             "\
      "          \n\nEgg Fried Rice                          £   3.95\nSingap"\
      "ore Noodle                        £   4.99\n")
    end
  end

end
