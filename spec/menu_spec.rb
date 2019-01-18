require 'menu'

describe Menu do
  let(:pizza) { double :dish, :name => "Pizza", :price => 15 }
  let(:goat) { double :dish, :name => "Goat", :price => 22 }

  describe "#add_to" do
    it 'accepts an argument which is a dish instance' do
      expect { subject.add_to(pizza) }.to_not raise_error
    end
  end

  describe "#items" do
    it 'returns a hash of names and prices' do
      menu = Menu.new
      menu.add_to(pizza)
      menu.add_to(goat)
      expect(menu.items).to eq ({ "Pizza" => 15, "Goat" => 22 })
    end
  end
end
