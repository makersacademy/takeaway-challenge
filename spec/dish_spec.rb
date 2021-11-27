require 'dish'

describe Dish do
  it { should be_an_instance_of Dish }
  it { should have_attributes(:name => nil, :price => nil, :qty => 0) }
end
