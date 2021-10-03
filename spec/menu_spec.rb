require 'menu'

describe Menu do
  let(:menu) { described_class.new }
  let(:new_order) { Order.new }

  describe "#display_menu" do
    it 'includes menu items' do
      expect(menu.display_menu).to include ({ :name => "Risotto", :price => 7.99 })
    end
  end

  describe "#print_welcome" do
    it 'outputs a welcome message' do
      expect { menu.print_welcome }.to output("Welcome to Sergei's takeaway\n").to_stdout
    end
  end

  describe "#start_new_order" do
    it 'creates a new Order' do
      expect(menu.start_new_order).to be_an_instance_of Order
    end
  end

  describe "#display_order" do
    it 'creates a new Order' do
    end
  end

  describe "#input_order" do
    it 'accepts user input' do
    end
  end

  describe "#add_to_order" do
    it 'adds new items to the order array' do
      # expect(menu.add_to_order(item)
    end
  end

  describe "#order_food" do
    it 'outputs a message' do
      expect { menu.order_food }.to output("Enter the number of the menu item to add to your order.\nTo finish your order, hit return twice.\n").to_stdout
    end
  end
end
