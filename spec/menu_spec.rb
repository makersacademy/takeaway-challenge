require 'menu.rb'

describe Menu do

  let(:dish1) {double("fake dish 1", :name => "dish1 name", :price => 40)}
  let(:dish2) {double("fake dish 2", :name => "dish2 name", :price => 50)}
  let(:dish3) {double("fake dish 3", :name => "dish3 name", :price => 60)}

  it "contains an array of dishes, which is empty by default" do
    expect(subject.dishes).to eq([])
  end

  describe "#add_dish" do
    it "takes 1 argument" do
      expect(subject).to respond_to(:add_dish).with(1).argument
    end
    it "adds a single dish to the menu" do
      subject.add_dish(dish1)
      expect(subject.dishes).to eq([dish1])
    end
    it "adds multiple dishes to the menu" do
      subject.add_dish(dish1)
      subject.add_dish(dish2)
      subject.add_dish(dish3)
      expect(subject.dishes).to eq([dish1, dish2, dish3])
    end
  end

  describe "#see_menu" do
    it "shows a menu in the terminal containing three dishes" do
      subject.add_dish(dish1)
      subject.add_dish(dish2)
      subject.add_dish(dish3)
      expect{subject.see_menu}.to output("dish1 name, 40\ndish2 name, 50\ndish3 name, 60\n").to_stdout
    end
  end
end
