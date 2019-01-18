require 'interface'

describe Interface do
  let(:menu) { double :menu, :items => ({ "Pizza" => 15, "Goat" => 22 }) }

  describe "#see_list" do
    it 'returns a menu' do
      interface = Interface.new(menu)
      expect(interface.see_list).to eq [["Pizza", 15], ["Goat", 22]]
    end
  end

  describe "#select_dish" do
    it 'stores an argument in selected dishes' do
      interface = Interface.new
      interface.select_dish("Pizza")
      expect(interface.instance_variable_get(:@selected_dishes)).to eq ({ "Pizza" => 1 })
    end

    it 'accepts a second parameter which it also stores' do
      interface = Interface.new
      interface.select_dish("Pizza", 3)
      expect(interface.instance_variable_get(:@selected_dishes)).to eq ({ "Pizza" => 3 })
    end
  end

  describe "#verify_order" do
    it 'returns a list showing name, quantity & total price' do
      interface = Interface.new(menu)
      interface.instance_variable_set(:@selected_dishes, { "Pizza" => 3 })
      expect(interface.verify_order).to eq [["Pizza", 3, 45]]
    end
  end

  describe "#finalize_order" do
    it 'creates a reassurer and calls reassure on it' do
      ordertime = (Time.now + 3600).strftime("%H:%M:%S")
      expect(subject.finalize_order).to eq "Thank you! Your order was placed and will be delivered before #{ordertime}"
    end
  end
end
