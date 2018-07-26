# require "twilio-ruby"
require "date"
require "order"
describe Order do

  # Doubles
  # Instace of menu class
  let(:menu)      { double :menu_instance, menu: [{name: "prawns", price: 5.25}] }

  
  subject(:order) { Order.new(menu) }

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

  describe "#show_me" do
    it "shows me everything" do
      puts menu
      puts menu.menu
    puts menu.menu[0][:name]
    end
  end

  describe "#add" do
    it "responds to add method with 2 arguments" do
      expect(order).to respond_to(:add).with(2).arguments
    end

    it "raises error 'Select dish from menu' if selected dish is not in the menu" do
      expect{ order.add("fish",192) }.to raise_error("Select dish from menu")
    end

    it "adds a dish and quantity to the order summary" do
      order.add("prawns",10.50)
      expect(order.summary).to include({name: "prawns", quantity: 10.50})
    end
  end

  describe "#total" do
    it "responds to total method" do
      expect(order).to respond_to(:total)
    end

    it "multiplies proice by quantity and adds to total to calculate order total" do
      order.add("prawns", 2)
      order.add("prawns", 3)
      expect(order.total).to eq 26.25
    end 
  end 

  describe "#confirm" do
    it "responds to confirm method" do
      expect(order).to respond_to(:confirm)
    end

    it "raises error 'Must select a dish' if summary is empty when confirm is called" do
      expect {order.confirm}.to raise_error("Must select a dish")
    end

    it "empties summary" do
      order.add("prawns", 4)
      order.confirm
      expect(order.summary).to be_empty
    end 

    it "sets total to zero" do
      order.add("prawns", 4)
      order.confirm
      expect(order.total).to eq 0
    end 
  end

    # describe "#reset" do
  #   it "responds to reset method" do
  #     expect(order).to respond_to(:reset)
  #   end

  #   it "clears summary array" do
  #     order.add("prawns", 2)
  #     order.reset
  #     expect(order.summary).to be_empty
  #   end 
    
  #   it "sets total to zero" do
  #     order.add("prawns", 2)
  #     order.total
  #     order.reset
  #     expect(order.total).to eq 0
  #   end
  # end 

  # describe "#delivery_time" do
  #   it "returns time in one hour" do
  #     time = Time.new
  #     expect(order.delivery_time).to eq((time + (1 * 60 * 60)).strftime("at %I:%M%p"))
  #   end 
  # end
end
