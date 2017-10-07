require 'takeaway.rb'

describe Takeaway do
  subject(:takeaway) {described_class.new}
  let(:dish) do
    { "curry" => 1.00,
    "xcurry" => 1.00 }
  end

  it 'has a list of dishes' do
    expect(takeaway.menu).to be_an_instance_of(Dishes)
  end

  it 'prints a list of dishes' do
    expect(takeaway.print_menu).to include(dish)
  end

  it 'selects from the menu' do
    expect(takeaway).to respond_to(:select_dish).with(1).argument
  end

  it 'starts with an empty basket' do
    # expect(takeaway.basket).to be_empty
    expect(takeaway.basket).to be_an_instance_of Hash
  end

  







end
