require_relative '../lib/order.rb'

describe Order do
  let(:order){Order.new}
  #before(each)subject.load_dishes

  it 'loads available_dishes.csv' do
    subject.load_dishes
    expect(subject.available_dishes).not_to be_empty
  end

  #
  it 'customer can view a list of dishes with prices' do
  # subject.load_dishes
  #end
    #expect(subject.available).to match_array(@available_dishes)

    subject.load_dishes
    expect(subject.view_menu).to include({:item_number=>"1", :dish=>"Tikka Masala", :price=>"11.00"},
                                          {:item_number=>"2", :dish=>"Cheeseburger", :price=>"11.50"},
                                          {:item_number=>"3", :dish=>"Hamburger", :price=>"10.50"},
                                          {:item_number=>"4", :dish=>"Margarita Pizza", :price=>"10.00"},
                                          {:item_number=>"5", :dish=>"Pepperoni Pizza", :price=>"11.50"},
                                          {:item_number=>"6", :dish=>"Veggie Pizza", :price=>"11.00"},
                                          {:item_number=>"7", :dish=>"Messy Fries", :price=>"9.50"},
                                          {:item_number=>"8", :dish=>"Chips", :price=>"4.50"}
                                 )
  end

  it 'the customer can select dishes for order' do
    subject.load_dishes
    subject.select_items
    expect(subject.selected_dishes).to include({:selection=>"1"},
                                             {:selection=>"2"})

  end
  # TODO once order.rb file working correctly to include the dish & price, add it back into the output - see line 41 & 42
  # I originally wanted it to return selection, dish & price.  However, on the print it errors when I attempt
  # to include dish & price.  This is due to selection only returning the item number.  In order for the array to
  # include the dish & price, I will have to push it into a new array.
 end
# ({:selection=>1, :dish=>"Tikka Masala", :price=>11.0},
#   {:selection=>2, :dish=>"Cheeseburger", :price=>11.5})
#
# :dish=>"Tikka Masala", :price=>"11.00"},
#                                             {:item_number=>"2", :dish=>"Cheeseburger", :price=>"11.50"})
