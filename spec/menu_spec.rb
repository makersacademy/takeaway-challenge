require 'menu'
describe Menu do
  let(:menu) { Menu.new }
  describe '#initialize' do
    it "returns an instance of the menu class" do
      expect(menu).to be_an_instance_of Menu
    end
  end

  describe "#add_dish" do
    let(:dish) { double("Dish") }
    it { is_expected.to respond_to(:add_dish).with(1).argument }
   
    it "adds a dish to the menu" do
      expect(menu.add_dish('dish')).not_to be_empty
    end
  end

  describe "#print_menu" do
    let(:dish) { double("Dish") }

    before(:each) do
      allow(dish).to receive(:name).and_return("pizza")
      allow(dish).to receive(:price).and_return("£20")
    end

    it "prints the menu" do
      menu.add_dish(dish) 
      expect { menu.print_menu }.to output("Name: #{dish.name} - Price: £#{dish.price}\n").to_stdout
    end
  end
end 
