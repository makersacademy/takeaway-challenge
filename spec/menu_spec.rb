require './docs/menu.rb'

describe Menu do
  context "#display" do
    it "shows the menu and prices" do
      message = "King's Fired Rice £88\nSecret Roast Goose £322\nSorrowful Rice £696\nBuddha Jumping Wall £122\nBeef Balls £155\nPissing Shrimp £162\nPissing Beef Balls £299\n"
      expect { subject.display }.to output(message).to_stdout
    end
  end
end
