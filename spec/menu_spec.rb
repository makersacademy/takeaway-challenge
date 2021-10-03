require 'menu'

describe Menu do
  let(:menu) { described_class.new }

  describe "#display_menu" do
    it 'includes menu items' do
      expect(menu.display_menu).to include ({ :name => "Risotto", :price => 7.99 })
    end
  end

  describe "#welcome" do
    it 'outputs a welcome message' do
      expect { menu.welcome }.to output("Welcome to Sergei's takeaway\n").to_stdout
    end
  end

  describe "#order_food" do
    it 'outputs a message' do
      expect { menu.order_food }.to output("Enter the menu number\n").to_stdout
    end
  end
end
