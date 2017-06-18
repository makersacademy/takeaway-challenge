require 'menu'

describe Menu do

  it { is_expected.to respond_to(:dishes) }

  describe "#add" do
    it "can add to the menu" do
      subject.add('taco', 6)
      expect(subject.dishes).to include('taco' => 6)
    end
  end

  describe "#display_basket" do
    it "should display the content of the basket to STDOUT" do
      menu = Menu.new
      expect { menu.display_menu }.to output.to_stdout
    end
  end
end
