# require "twilio-ruby"
require "date"
require "order"
describe Order do

  # Doubles
  # Menu (the class)
  # Instace of menu class
  let(:menu_class) { double :menu_class, new: menu }
  let(:menu)       { double :menu_instance         }

  subject(:order) { Order.new(menu_class) }

  describe "#initialize" do
    it "initializes with an empty order summary array" do
      expect(order.summary).to be_empty
    end

    it "initializes total equal to zero" do
      expect(order.total).to eq 0
    end

    it "initializes a menu object" do
      expect(menu).to receive(:new)
      menu.new
    end
  end

  describe "#reset" do
    it "clears array" do
      order.add("prawns", 10)
      order.reset
      expect(order.summary).to be_empty
    end
    
    it "sets total to zero" do
      order.add("prawns", 10)
      order.reset
      expect(order.total).to eq 0
    end
  end 
  
  describe "#add" do
    it "requires to menu object to raise errror" do
      expect(menu).to receive(:menu)
      menu.menu
    end

    it "adds a dish and quantity to the order summary" do
      order.add("fire", 15)
      expect(order.summary).to include({ name: "fire", quantity: 15 })
    end
  end

  describe "#total" do
    it "responds to total method" do
      expect(order).to respond_to(:total)
    end
    
    it "requires menu object to complete calculation" do
      expect(menu).to receive(:menu)
      menu.menu
    end
  end 

  describe "#confirm" do
    it "raises error it attempt to confirm with no dishes" do
      expect { order.confirm }.to raise_error "Must select a dish"
    end 

    it "resets variables" do
      order.add("prawns", 1)
      order.confirm
      expect(order.total).to eq 0
    end 
  end

  describe "#delivery_time" do
    it "returns time in one hour" do
      time = Time.new
      expect(order.delivery_time).to eq(time + (1 * 60 * 60)).strftime("at %I:%M%p")
    end 
  end
end
