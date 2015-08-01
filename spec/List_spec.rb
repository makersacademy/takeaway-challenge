require 'List'

describe List do
  it 'has a predefined list of dishes with prices' do
    dish_list = subject.show
    expect(dish_list).to have_at_least(5).dishes
  end
end