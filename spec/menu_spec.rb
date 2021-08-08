require "./lib/menu.rb"

describe Menu do

  it "shows the Menu class to have @dishes" do
    expect(subject).to respond_to :dishes
  end

  it "shows the Menu class to have @dishes" do
    expect(subject).to respond_to :get_dish
  end

  context "when asked for a non existing dish" do
    it "should return nil" do
      expect(subject.get_dish("chips").nil?).to eq(true)
    end
  end

  context "when asked for an existing dish" do
    it "should return a dish with the name spring roll" do
      expect(subject.get_dish("spring roll").name).to eq("spring roll")
    end
  end

end
