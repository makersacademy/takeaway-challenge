require 'takeaway'

describe TakeAway do
  let(:menu){ double(:menu) }
  before(:each) do
    allow(menu).to receive(:dishes).and_return({ "chilli squid" => 3.95 })
  end

  it "can add a menu" do
    expect(subject.add_menu(menu)).to eq(menu.dishes)
  end

  it "can show the menu" do
    expect(subject.show_menu).to eq(subject.menu)
  end

  describe "#place_order" do
    before(:each) do
      subject.add_menu(menu)
      allow(menu.dishes).to receive(:[]).with("chilli squid").and_return(3.95)
    end

    it "responds to method place_order" do
      expect(subject).to respond_to(:place_order).with(2).argument
    end

    it "adds item to order hash" do
      subject.place_order("chilli squid", 1)
      expect(subject.order).to include("chilli squid x 1")
    end

    xit "adds correct quantity of item to order" do
      subject.place_order("chilli squid", 3) do

      end

    end
  end

end