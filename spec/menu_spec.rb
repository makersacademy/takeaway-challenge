require 'menu'

describe Menu do

  describe "#initialize/new" do

    it "starts with an empy list of dishes" do
      new_menu = Menu.new
      expect(new_menu.dishes).to eq([])
    end

  end

  describe "#add_dish" do

    it 'raises error when dish passed in does not respond to name' do
      expect{subject.add_dish('not_a_dish')}.to raise_error 'invalid dish'
    end

    it 'raises error when dish name is not a valid string' do
      dish = double(:dish)
      allow(dish).to receive(:name).and_return(11)
      expect{subject.add_dish(dish)}.to raise_error 'invalid name'
    end

    it 'raises error when dish passed in does not respond to price' do
      expect{subject.add_dish('not_a_dish')}.to raise_error 'invalid dish'
    end

    it 'raises error when dish pass has a none numerical price' do
      dish = double(:dish)
      allow(dish).to receive(:name).and_return('dish_name')
      allow(dish).to receive(:price).and_return('this is a joke')
      expect{subject.add_dish(dish)}.to raise_error 'invalid price'
    end

    it 'adds a dish to menu with passed dish-like object' do
      dish = double(:dish)
      allow(dish).to receive(:name).and_return('dish_name')
      allow(dish).to receive(:price).and_return(9.99)
      subject.add_dish(dish)
      expect(subject.dishes).to eq([dish])
    end

  end

  describe "#display" do

    it 'displays the current dishes on the menu with name and price' do
      dish1 = double(:dish)
      dish2 = double(:dish)
      allow(dish1).to receive(:name).and_return('Egg Fried Rice')
      allow(dish1).to receive(:price).and_return(3.95)
      allow(dish2).to receive(:name).and_return('Singapore Noodle')
      allow(dish2).to receive(:price).and_return(4.99)
      allow(dish1).to receive(:display_info).and_return(
      'Egg Fried Rice                          £   3.95')
      allow(dish2).to receive(:display_info).and_return(
      'Singapore Noodle                        £   4.99')
      subject.add_dish(dish1)
      subject.add_dish(dish2)
      expect(subject.display).to eq("                  MENU  \n\nEgg Fried"\
      " Rice                          £   3.95\nSingapore Noodle"\
      "                        £   4.99\n")
    end

  end

end
