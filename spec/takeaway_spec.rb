require_relative '../lib/takeaway'

describe Takeaway do
  let (:menu_double) { double(:menu, list_items: ("Korma: £8.50\n" +
                                                  "Jalfrezi: £9.00\n" +
                                                  "Tikka Masala: £8.00")) 
  }
  let (:subject) { Takeaway.new(menu_double) }
  
  context "#show_menu" do
    it "shows the menu" do
      expect(subject.show_menu).to eq ("Korma: £8.50\n" +
                                       "Jalfrezi: £9.00\n" +
                                       "Tikka Masala: £8.00")
    end
  end
end
