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
    expect(subject.selected_dishes).to include({:item_number=>"1", :dish=>"Tikka Masala", :price=>"11.00"},
                                               {:item_number=>"2", :dish=>"Cheeseburger", :price=>"11.50"}
                                      )
  end

  it 'the customer can verify total' do
    subject.load_dishes
    subject.select_items
    expect(subject.order_sum).to eq("22.50")
  end

  it 'the customer can verify total is correct against the items ordered with price' do
    subject.load_dishes
    subject.select_items
    expect(subject.show_order).to eq("22.50")
  end

 end
# ({:selection=>1, :dish=>"Tikka Masala", :price=>11.0},
#   {:selection=>2, :dish=>"Cheeseburger", :price=>11.5})
#
# :dish=>"Tikka Masala", :price=>"11.00"},
#                                             {:item_number=>"2", :dish=>"Cheeseburger", :price=>"11.50"})
