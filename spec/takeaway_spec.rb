require "takeaway"
require "menu"

describe Takeaway do
  let(:takeaway) { (Takeaway.new) }

  context "show_menu" do
    it "shows a list of dishes with prices" do
      expect(takeaway.show_menu).to eq takeaway.hash_menu
    end
  end

  context "add_items" do
    it 'will be able to add_items to takeaway order' do
      takeaway.add_items("Chicken", 3)
      expect(takeaway.order_count).to eq 3
    end

    it "will be able to select a number of available dishes" do
      takeaway.add_items("Chicken", 3)
      expect(takeaway.menu_choice.first).to eq ["Chicken", 3]
    end

    it "will check that the correct number of orders has been placed" do
      takeaway.add_items("Chicken", 3)
      expect(takeaway.order_count). to eq 3
    end

    it "will raise an error if a non-available item is chosen" do
       takeaway.add_items("Chicken", 3)
       expect{takeaway.add_items("Beef", 2)}.to raise_error "Ooops, that item is not available"
     end
  end

  context "get_overall_price" do
    it "will calculate the correct overall order price" do
      takeaway.add_items("Chicken", 3)
      takeaway.add_items("Cobra", 5)
      expect(takeaway.total_price). to eq 35
    end
  end


end


# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

#it 'should be able to add_items to takeaway order' do
  #@takeaway = takeaway
  #@takeaway.stub(:gets) {"chicken\n"}
  #@takeaway.stub(:gets) {"3\n"}
  #@takeaway.stub(:gets) {"exit\n"}
  #expect(takeaway.select_item).to eq "menu choice"
  #takeaway.add_items("Chicken", 3)
  #expect(takeaway.order_count).to eq 3
#end
