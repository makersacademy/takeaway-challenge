require_relative '../lib/takeaway'

describe Takeaway do
  context "#list_menu" do
    it "shows a list of items with pricing" do
      expect(subject.list_menu).to eq ("Korma: £8.50\n" +
                                       "Jalfrezi: £9.00\n" +
                                       "Tikka Masala: £8.00")
    end
  end
end
