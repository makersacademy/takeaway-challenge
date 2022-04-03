require_relative '../lib/takeaway'

describe Takeaway do
  let (:menu_double) { double(:menu, list_items: ("Korma: £8.50\n" +
                                                  "Jalfrezi: £9.00\n" +
                                                  "Tikka Masala: £8.00")) 
  }
  let (:subject) { Takeaway.new(menu_double) }

  context "#creation" do
    it "shows the menu" do
      expect(subject.show_menu).to eq ("Korma: £8.50\n" +
                                        "Jalfrezi: £9.00\n" +
                                        "Tikka Masala: £8.00")
    end

    it "has an empty current order" do
      expect(subject.show_order).to eq ""
    end
  end

  context "#add_to_order" do
    before (:each) do
      subject.add_to_order("Korma")
    end

    it "adds dishes to the current order" do
      expect(subject.show_order).to eq "Korma: £8.50\n"
    end
  end
end
