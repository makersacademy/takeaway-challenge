require 'menu'

RSpec.describe Menu do

  subject { described_class.new(menu_items: [{ name: "Spaghetti and Meatballs", price: 5.00 }]) }
  context "on initializing" do
    it "has a menu" do
      expect(subject.menu_items).to eq [{ name: "Spaghetti and Meatballs", price: 5.00 }]
    end

    it "can add items to the menu" do
      subject.add_item("Pizza", 6.00)
      expect(subject.menu_items).to eq [{ name: "Spaghetti and Meatballs", price: 5.00 },
                                        { name: "Pizza", price: 6.00 }]
    end
  end

  it "can display the menu" do
    expect(subject.display_menu).to eq(["Spaghetti and Meatballs: £5.00"])
  end

  it "can check if items are on the menu" do
    expect(subject.on_the_menu?("Fish and Chips")).to eq false
  end

  it "can return a hash containing name and price given the name of the dish" do
    expect(subject.search_menu("Spaghetti and Meatballs")).to eq({ name: "Spaghetti and Meatballs", price: 5.00 })
  end
end
