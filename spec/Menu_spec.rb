require "Menu.rb"

describe Menu do
  menu_string = "Regular Burger, £5.00\nstandard hamburger\n\n"\
    "Special Burger, £5.95\nmarinated in orphen's tears\n\n"\
    "Cheese Burger, £5.50\nregular burger with cheese\n\n"\
    "Fries, £2.00\nskinny fries\n\n"\
    "Side Salad, £2.50\nlittle gem lettuce and baby spinich, with a ceaser dressing\n\n"\
    "Soft Drink, £2.00\ncoke, fanta, tango\n\n"\
    "Beer, £4.00\nHobgoblin Ruby or Dead Pony IPA\n\n"

  it "prints the menu" do
    expect(subject.print).to eq menu_string
  end

  context "#available?" do
    it "returns item hash for available items" do
      item_hash = {name: "Cheese Burger", description: "regular burger with cheese", price: 5.50, available: true}
      expect(subject.available?("Cheese Burger")).to include( item_hash)
    end

    it "returns false for unavailable items" do
      expect(subject.available?("Special Burger")).to be false
    end

    it "raises error if item not on menu" do
      expect{subject.available?("Penis Burger")}.to raise_error("Penis Burger not on the menu")
    end

    it "menu is safe from editing" do
      item_hash = subject.available?("Cheese Burger")
      item_hash[:description] = "nope"
      expect(subject.available?("Cheese Burger")).not_to include({description: "nope"})
    end
  end
end