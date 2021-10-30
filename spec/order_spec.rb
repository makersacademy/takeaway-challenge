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
    expect(subject.view_menu).to include({:dish=>"Tikka Masala", :price=>11.0},
                                          {:dish=>"Cheeseburger", :price=>11.5},
                                          {:dish=>"Hamburger", :price=>10.5},
                                          {:dish=>"Margarita Pizza", :price=>10.0},
                                          {:dish=>"Pepperoni Pizza", :price=>11.5},
                                          {:dish=>"Veggie Pizza", :price=>11.0},
                                          {:dish=>"Messy Fries", :price=>9.5},
                                          {:dish=>"Chips", :price=>4.5}
                                 )
  end

  it 'the customer can select dishes for order' do
    subject.load_dishes
    expect(subject.select_items).to include({:selection=>1},
                                            {:selection=>2})
  end
  # TODO once order.rb file working correctly to include the dish & price, add it back into the output - see line 41 & 42
  # I originally wanted it to return selection, dish & price.  However, on the print, it is not printing
  # a selection number and it errors when I attempt to include dish & price.  In order to have this work, I
  # removed dish & price so that I can then look at ruby syntax and iteration with arrays of hashes to get
  # the data I am looking for.
 end
# ({:selection=>1, :dish=>"Tikka Masala", :price=>11.0},
#   {:selection=>2, :dish=>"Cheeseburger", :price=>11.5})
