require 'menu'

describe Menu do
  it "Expects menu to be an instance of Menu class" do
    expect(subject).to be_an_instance_of(Menu)
  end

  it "Expects menu to respond to dishes" do
    expect(subject).to respond_to(:dishes)
  end

  it "Expects to see a list of dishes" do
    expect(subject.dishes).to eq ({ "Pizza" => 8, "Chicken wings" => 5, "Chips" => 2, "Battered cod" => 6, "Cheeseburger" => 4, "Veggie burger" => 4 })
  end

  it "Expects menu to respond to view_dishes" do
    expect(subject).to respond_to(:view_dishes)
  end

  let(:menu) {Menu.new}

  describe '#dishes' do
    it "Expects to see price of select dish" do
      expect(menu.dishes["Cheeseburger"]).to eq(4)
    end
  end

  describe '#view_dishes' do
    it "Expexts to see a menu item and price" do
      expect(menu.view_dishes).to include("Cheeseburger: £4")
    end
  end

end
