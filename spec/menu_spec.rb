require 'menu'

describe Menu do

  let(:test_menu) { Menu.new }

  # Replace long menu with a shorter but still functional menu for tests
  before do
    test_menu.instance_variable_set(:@menu, { "Breakfast": [{ "name": "Breakfast Burrito", "price": 5.00 }], "Dinner": [{ "name": "Steak", "price": 9.75 }] })
  end

  describe "#initialize" do
    it "parses menu.json into @menu and converts keys to symbols" do
      file = File.read('menu.json')
      expect(subject.menu).to eq JSON.parse(file, :symbolize_names => true)
    end
  end

# This test looks really bad due to string justification but I don't know what else to do, I want to keep
  describe "#print_all" do
    it { is_expected.to respond_to :print_all }
    it "prints all items from @menu" do
      expect { test_menu.print_all }.to output("\n               Breakfast                \n          --------------------          \n       Breakfast Burrito: £5.00\n\n                 Dinner                 \n          --------------------          \n                   Steak: £9.75\n\n").to_stdout
    end
  end

# This test also looks really bad
  describe "#print_category" do
    it { is_expected.to respond_to(:print_category).with(1).argument }
    it "prints all items from @menu" do
      expect { test_menu.print_category("Dinner") }.to output("\n                 Dinner                 \n          --------------------          \n                   Steak: £9.75\n\n").to_stdout
    end
  end

end
