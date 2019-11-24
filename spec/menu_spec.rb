require 'menu'

menu = {"Hamster Soup" => 11.50, "Orechiette" => 4.40, "Vegan Offal" => 1.10}


describe Menu do

  describe "#open" do
  it 'Opens the menu' do
    expect(subject.open).to eq(menu)
  end
  end

  describe "#choose" do
    it 'adds a dish to the basket' do
      expect(subject.choose("Hamster Soup", 2)).to eq({"Hamster Soup"=>11.50})
    end
  end

  describe "#total" do
    it 'shows the total price of all items selected' do
      menu1 = Menu.new
      menu1.choose("Hamster Soup", 2)
      menu1.choose("Vegan Offal", 2)
      expect(menu1.total).to eq(25.20)
    end
  end

  describe "#checkout" do
    it "confirms order" do
      expect(subject.checkout). to eq(@order)
    end
  end 

end
