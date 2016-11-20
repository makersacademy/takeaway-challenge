require 'menu'

describe Menu do

    #let(:menu) { double(Menu.new) }

    it "should contain a hash of items and prices" do
      expect(subject.menu_list).to include({
        "Pizza" => 10,
        "Fish and chips" => 8,
        "Onion bhaji" => 5,
        "Pickled egg" => 2
      })
    end

end
