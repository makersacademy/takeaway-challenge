require "menu"

describe Takeaway do

  it "has a list of dishes and prices" do
    expect(subject.menu).to include(
          "Baba Ganoush" => 4,
          "Donut" => 2,
          "Entire wheel of cheese" => 10,
          "Distended stomach" => 7,
          "Diet culture guilt trip" => 0,
          "Your usual" => 5)
  end

  it "prints the menu" do
    expect{subject.print_menu}.to output(a_string_including("Baba Ganoush")).to_stdout
  end

  context "taking an order" do
    describe "#select_dish" do
      it { is_expected.to respond_to(:select_dish).with(1).argument }
    end

    it "can store selections" do
      subject.select_dish("Donut")
      expect(subject.order).not_to be_empty
    end
  end

  context "order summary" do
    before(:each) do
      subject.select_dish("Donut")
      subject.select_dish("Your usual")
    end

    it "gives total value of selected dishes" do
      expect(subject.total).to eq(7)
    end

    it "prints order summary" do
      expect{subject.order_summary}.to output("Donut £2\nYour usual £5\nTotal £7").to_stdout
    end

    it "sends thank you text" do
      expect(subject.confirm_order).to eq(@message)
    end
  end
end
