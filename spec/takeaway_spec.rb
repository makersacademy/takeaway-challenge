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

  it 'selects from the list of dishes' do

  end

end






require 'takeaway.rb'

describe Takeaway do
  subject(:takeaway) {described_class.new}


  it 'has a list of dishes' do
    expect(takeaway.menu).to be_an_instance_of(Dishes)
  end


  # it 'prints a list of dishes' do
  #   expect(takeaway.list).to
  # end








end
