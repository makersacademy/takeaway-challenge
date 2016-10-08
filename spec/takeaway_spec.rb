require "takeaway"
require "menu"

describe Takeaway do
  let(:takeaway) { (Takeaway.new) }


  it "shows a list of dishes with prices" do

    expect(takeaway.show_menu).to eq Menu::MENU
  end
  it 'should be able to add_items to takeaway' do
    #@takeaway = takeaway
    #@takeaway.stub(:gets) {"chicken\n"}
    #@takeaway.stub(:gets) {"3\n"}
    #@takeaway.stub(:gets) {"exit\n"}
    #expect(takeaway.select_item).to eq "menu choice"
    takeaway.add_items("Chicken", 3)
    expect(takeaway.order_count).to eq 3
  end
  #
  it "should be able to select a number of available dishes" do
    takeaway.add_items("Chicken", 3)
    expect(takeaway.menu_choice.first).to eq ["Chicken", 3]
  end


  # it "will raise an error if the total order number does not match the sum of the various dishes in the customer order"
    #expect{ subject.touch_in(:entry_station) }.to raise_error "Insufficient funds"


end

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
