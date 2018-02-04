require 'menu'

describe Menu do

  let(:menu) { described_class.new }

  context "#initialize" do
    it "dishes is a hash of available dishes and prices" do
      expect(menu.dishes).to be_a Hash
    end
  end

  context "#print_menu" do
    it "print_menu prints the menu" do
      expect { menu.print_menu }.to output.to_stdout
    end
  end

end
