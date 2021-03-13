require 'menu'

describe Menu do
  describe 'intialize' do
    it "is an array" do
      expect(subject.menu_list).to be_a(Array)
    end
    it "a list of all the items for the order" do
      expect(subject.order_list).to be_a(Array)
    end
    it "stores a variable for the order total" do
      expect(subject.order_total).to be_a(Integer)
    end
  end

  describe "load_menu_items" do
    it "loads the contents of the CSV file to the array menu_list as hashes" do
      expect(subject.load_menu_items).to include(include(:name, :price,))
    end
  end

  describe "search_menu_items" do
    it "finds the item within the menu when passed a number" do
      expect(subject.search_menu_items(1)).to eq({ :number => 1, :name => "Veggie chow mein", :price => 4, :preparation_time => 15 })
    end
    it "finds the time within the menu when passed a item name" do
      expect(subject.search_menu_items("Veggie chow mein")).to eq({ :number => 1, :name => "Veggie chow mein", :price => 4, :preparation_time => 15 })
    end
  end

  describe "add_to_order" do
    it "allows the user to enter multiple dishes to their order." do
      allow($stdout).to receive(:write)
      allow($stdin).to receive(:gets).and_return("1", "y", "y")
      expect(subject.add_to_order).to be_a(Array)
    end
  end

  describe "order_entry" do
    before do
      allow($stdout).to receive(:write)
    end
    it "should capture the customers order" do
      allow($stdin).to receive(:gets).and_return("1", "y")
      allow(subject).to receive(:search_menu_items).and_return(1)
      expect(subject.order_entry).to eq(1)
    end
    it "should allow the customer to change the dish if incorrect" do
      allow($stdin).to receive(:gets).and_return("2", "n", "1", "Y")
      allow(subject).to receive(:search_menu_items).and_return(1)
      expect(subject.order_entry).to eq(1)
    end
  end  

  describe "input_check" do
    it "when the input is a string return downcase of that string" do
      expect(subject.input_check("WoRd")).to eq("Word")
    end
    it "when the input is a number in a string return the int of that number" do
      expect(subject.input_check("10")).to eq(10)
    end
  end

  describe "order_total_update" do
    it "updates the order_total from the current order_list" do
      menu = Menu.new
      allow($stdout).to receive(:write)
      allow($stdin).to receive(:gets).and_return("1", "y", "y")
      menu.add_to_order
      expect(menu.order_total_update).to be(4)
      puts menu.order_total
    end
  end
end
