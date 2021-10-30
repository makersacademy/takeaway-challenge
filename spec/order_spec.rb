require_relative '../lib/order.rb'

describe Order do
  let(:order){Order.new}

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
  end
