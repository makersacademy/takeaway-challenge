require "order"

describe Order do
  it { is_expected.to be_an_instance_of Order }

  describe "#initialize" do
    it "initializes with a new instance of the Menu class" do
      expect(subject).to have_attributes(:menu => Menu.new.menu)
    end
  end
end
