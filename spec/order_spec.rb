require_relative '../lib/order.rb'

RSpec::Mocks.configuration.allow_message_expectations_on_nil = true

describe Order do
  let(:order){Order.new}

  let(:selected_dishes) do
    [
      double({:item_number=>"1", :dish=>"Tikka Masala", :price=>"11.00"},
      {:item_number=>"2", :dish=>"Cheeseburger", :price=>"11.50"})
    ]
  end
  it 'loads available_dishes.csv' do
    subject.load_dishes
    expect(subject.available_dishes).not_to be_empty
  end

  it 'customer can view a list of dishes with prices' do
   #expect(subject.available).to match_array(@available_dishes)
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
    subject.select_items
    expect(subject.selected_dishes).to include({:item_number=>"1", :dish=>"Tikka Masala", :price=>"11.00"},
                                               {:item_number=>"2", :dish=>"Cheeseburger", :price=>"11.50"}
                                       )
  end

  it 'the customer can verify total' do
    subject.select_items
    subject.selected_dishes
    expect(subject.order_sum).to eq("22.50")
  end

  it 'the customer can verify total is correct against the items ordered with price' do
    subject.select_items
    subject.selected_dishes
    expect(subject.show_order).to eq("22.50")
  end

  it 'customer can choose to select dishes again' do
    allow($dtdin).to receive(:gets).and_return('2')
    selection = $stdin.gets.chomp
    expect(subject.process(selection)).to eq ('2')
  end

   it 'customer can choose to submit order' do
    allow($dtdin).to receive(:gets).and_return('1')
    selection = $stdin.gets.chomp
    expect(subject.process(selection)).to eq ('1')
   end

  it 'sends a confirmation text message' do
    expect(subject).to receive(:submit_order)
    subject.submit_order
  end
end

#ToDO the stub functionality does not seem to be working and a text message is sent each time rspec is run with either test active
#
# TODO running in rspec is ugly because it calls the select_items method in 3 different tests.  This should be fixed at some point
