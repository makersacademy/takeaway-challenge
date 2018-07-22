require 'menu'
describe Menu do
let(:menu) {described_class.new}

  describe ' #print_menu' do
    it "prints a list of menu items with prices" do
      expect { menu.print_menu }.to output("chicken burger: 5.50\ncheese burger: 5.00\nvegetable fried rice: 4.50\n").to_stdout
    end
  end

end
