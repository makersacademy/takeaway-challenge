require 'dishes'

describe Dish do
   
  it 'has an empty list of dishes by default' do
    expect(subject.order_list).to be_empty
  end
end

