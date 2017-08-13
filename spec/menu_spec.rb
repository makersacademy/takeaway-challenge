require './docs/menu.rb'

describe Menu do
  context "#initialize" do
    it "shows hash table of menu items" do
      message = { "1. King's Fired Rice" => 88, "2. Secret Roast Goose" => 322, "3. Sorrowful Rice" => 696, "4. Buddha Jumping Wall" => 122, "5. Beef Balls" => 155, "6. Pissing Shrimp" => 162, "7. Pissing Beef Balls" => 299 }
      expect(subject.items).to eq(message)
    end
  end

  context "#display" do
    it "shows the menu and prices" do
      message = "1. King's Fired Rice £88\n2. Secret Roast Goose £322\n3. Sorrowful Rice £696\n4. Buddha Jumping Wall £122\n5. Beef Balls £155\n6. Pissing Shrimp £162\n7. Pissing Beef Balls £299\n"
      expect { subject.display }.to output(message).to_stdout
    end
  end
end
