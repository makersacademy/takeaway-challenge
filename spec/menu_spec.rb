require 'menu'

describe Menu do

let(:menu) { described_class.new }
  context "see a list of dishes with prices" do
    it "should return a list of dishes" do
      expect(menu.list_menu).to eq({
        1 => { :dish => "pasta", :price => 2.10 }, 
        2 => { :dish => "toast", :price => 2.50 },
        3 => { :dish => "pizza", :price => 2.80 },
        4 => { :dish => "fries", :price => 3.00 }
      })
    end
  end
  context "return selected dishes" do
    it "should be able to select dishes and return them" do
      menu.list_menu
      expect(menu.add_item([1, 3, 4])).to eq [{:dish=>"pasta", :price=>2.1}, { :dish => "pizza", :price => 2.80 }, { :dish => "fries", :price => 3.00 }]
    end
  end
  context "return total" do
    it "should be able to return total of selected dishes" do
      menu.list_menu
      menu.add_item([1, 3, 4])
      expect(menu.check_total).to eq 7.9
    end
  end
  context "confirm order" do
    it "shoud print confirm message" do
      menu.list_menu
      menu.add_item([1, 3, 4])
      menu.check_total
      expect(menu.confirm_order).to eq "Thank you! Your order was placed and will be delivered before 18:52"
    end
  end


end