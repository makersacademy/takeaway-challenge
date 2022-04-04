require_relative '../lib/menu'

describe Menu do
  context "#list_items" do
    it "lists all items on the menu with price" do
      expect(subject.list_items).to eq ("Korma: £8.50\n" +
                                        "Jalfrezi: £9.00\n" +
                                        "Tikka Masala: £8.00")
    end
  end
end
