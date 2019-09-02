require 'dishes'

describe Dishes do

  it 'responds to' do
    is_expected.to respond_to(:dish_list)
    is_expected.to respond_to(:list)

  end

end
