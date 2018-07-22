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

  describe "#print_all" do
    it { is_expected.to respond_to :print_all }
    it "prints all items from @menu" do
      expect { test_menu.print_all }.to output("\n#{"Breakfast".center(40)}\n#{"--------------------".center(40)}\n#{"Breakfast Burrito".rjust(24)}: £5.00\n\n#{"Dinner".center(40)}\n#{"--------------------".center(40)}\n#{"Steak".rjust(24)}: £9.75\n\n").to_stdout
    end
  end

  describe "#print_category" do
    it { is_expected.to respond_to(:print_category).with(1).argument }
    it "prints all items from @menu" do
      expect { test_menu.print_category("Dinner") }.to output("\n#{"Dinner".center(40)}\n#{"--------------------".center(40)}\n#{"Steak".rjust(24)}: £9.75\n\n").to_stdout
    end
  end

end
