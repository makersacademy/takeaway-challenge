require "order"

describe Order do

  it "order should start empty" do
    expect(subject.current_order).to eq []
  end

  describe "#view_menu" do
    it "should be able to view the menu while ordering" do
      expect(subject.view_menu).to eq Menu.new.dishes
    end
  end

  describe "#view_order" do

    it "should respond with the order and the total" do
      subject.add "Kotletai"
      expect(subject.view_order).to eq 'This is your order: [{"Kotletai"=>4.0}] and the total is: £4.0'
    end
  end

  describe "#add" do
    it "should add a meal to order" do
      expect(subject.add("Balandeliai")).to eq [{"Balandeliai"=>5}]
    end

    it "should raise error if trying to add a meal that isn't on the menu" do
      expect{subject.add("Chicken")}.to raise_error "This is not on the menu!"
    end
  end

  describe "#remove" do
    it "should remove food from the order" do
      subject.add "Cepelinai"
      subject.add "Balandeliai"
      expect(subject.remove("Cepelinai")).to eq [{"Balandeliai" => 5.00}]
    end
  end

  describe "#checkout" do
    xit "should access the text class" do
      expect(subject.checkout).to eq []
    end

    xit "should set @current_order to be empty" do
      subject.checkout
      expect(subject.current_order).to be []
    end
  end
end
