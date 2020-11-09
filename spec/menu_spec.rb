require 'menu'

describe Menu do

  let(:dish1) { double('dish', name: "Arrabiata", price: 9.99) }
  let(:dish2) { double('dish', name: "Bruschetta", price: 5.99) }
  let(:savs) { Menu.new("Sav's mains menu", [dish1, dish2]) }

  it "creates new instances with two arguments" do
    expect(Menu).to respond_to(:new).with(2).arguments
  end

  describe "#initialize" do
    it "initiates menu with custom name" do
      expect(savs.name).to eq "Sav's mains menu"
    end
    it "initiates menu with custom contents" do
      expect(savs.contents).to eq [dish1, dish2]
    end
  end

  describe "#view_menu" do
    it "displays the dish names and prices" do
      expect { savs.view_menu }.to output.to_stdout
    end
  end

end
