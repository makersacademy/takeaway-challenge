require "menu"

describe Menu do
  it "includes an array of instances of MenuItem" do
    expect(Menu::ITEMS[0]).to be_an_instance_of(MenuItem)
  end

  describe "#view" do
    it "displays the menu" do
      expect { Menu.view }.to output.to_stdout
    end

    it "displays the menu's title" do
      expect { Menu.view }.to output(/Pizza Takeaway/).to_stdout
    end

    it "shows the entire menu" do
      expect { Menu.view }.to output(<<~EOF
        Pizza Takeaway
        ===============================
        1. Margherita - £10.00
        2. Diavola - £11.00
        3. Boscaiola - £14.00
        4. Quattro Stagioni - £13.00
        5. Capricciosa - £12.00
        6. Marinara - £9.00
        ===============================
      EOF
      ).to_stdout
    end
  end
end
