require 'interface'

describe Interface do
  let(:menu) { double :menu, :items => ({ "Pizza" => 15, "Goat" => 22 }) }

  describe "#see_list" do
    it 'prints a menu' do
      interface = Interface.new(menu)
      expect(interface.see_list).to eq "Pizza, 15\nGoat, 22"
    end
  end
end
