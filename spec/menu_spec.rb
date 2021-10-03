require 'menu'

describe Menu do
  describe "#display_menu" do
    it 'includes menu items' do
      expect(subject.display_menu).to include ({ :name => "Risotto", :price => 7.99 })
    end
  end

  describe "#welcome" do
    it 'outputs a welcome message' do
      expect { subject.welcome }.to output("Welcome to Sergei's takeaway\n").to_stdout
    end
  end

  describe "#order_food" do
    it 'outputs a message' do
      expect { subject.order_food }.to output("Enter the menu number\n").to_stdout
    end
  end
end
