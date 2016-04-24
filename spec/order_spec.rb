require "order"

describe Order do

  it "order should start empty" do
    expect(subject.order).to eq []
  end

  describe "#view_menu" do
    it "should be able to view the menu while ordering" do
      expect(subject.view_menu).to eq Menu.new.dishes
    end
  end

  describe "#add" do
    it "should add a meal to order" do
      expect(subject.add("Balandeliai")).to eq [{"Balandeliai"=>5}]
    end

    it "should raise error if trying to add a meal that isn't on the menu" do
      expect{subject.add("Chicken")}.to raise_error "This food item is not on the menu!"
    end
  end

  describe "#total" do
    it "should take all values of order and work calculate total" do
      subject.add "Cepelinai"
      subject.add "Balandeliai"
      expect(subject.total).to eq 11.5
    end
  end

  describe "#checkout" do
    it "should send a text of the order and total as well as how long it will be"
  end
end
