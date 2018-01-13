require 'menu'

describe Menu do

  it { is_expected.to respond_to(:menu) }

  describe "#menu" do
    it "should have a list of dishes on the menu" do
      expect(subject.menu.length).to be > 0
    end
  end

  describe "#read_menu" do
    it "should print out a menu when requested by the customer" do
      expect { subject.read_menu }.to output(include("Spring Rolls: £3.99")).to_stdout
    end
  end

end
