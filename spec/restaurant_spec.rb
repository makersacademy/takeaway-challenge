require 'restaurant'

describe Restaurant do
  let(:food) { double :food }
  let(:menu1) { double :Menu }
  let(:resto) { described_class.new("name", menu1) }

  context "initializes" do

    it "won't initialize without a name and a menu parameter" do
      expect { described_class.new }.to raise_error
    end

    it 'initializes with a name and a menu' do
      expect(resto.name == "name" && resto.menu == menu1).to eq true
    end

  end

  context "restaurants can edit their menus" do

    it 'add_to_menu to an add method in menu class' do
      expect(menu1).to receive(:add_dish).with(food, 1)
      resto.add_to_menu(food, 1)
    end

    it 'remove menu item links to a remove method in menu class' do
      expect(menu1).to receive(:remove_dish).with(food)
      resto.remove_from_menu(food)
    end

  end

  context "reading menus" do

    it "can display the menu of the restaurant" do
      expect(menu1).to receive :display_list
      resto.display_menu
    end

  end

end
