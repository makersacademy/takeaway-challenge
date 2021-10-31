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
end

#
 #  pending it 'customer can choose to cancel' do
 #
 #  end
 # end
#
# let (:gets1) do
#   double{("1")
#   allow($stdin).to receive(:gets).and_return(:gets1)
#   expect(:gets1).to receive(:chomp).and_return('1')}
# end
# let (:gets2) do
#   double{("2")
#   allow($stdin).to receive(:gets).and_return(:gets2)
#   expect(:gets2).to receive(:chomp).and_return('2')}
# end