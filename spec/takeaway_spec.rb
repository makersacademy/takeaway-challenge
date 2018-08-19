require 'takeaway'

describe Takeaway do

  it '#dishes returns a list of dishes and prices' do
    expect(
      subject.dishes
    ).to include(dish: 'Fish and chips', price: 8)
  end

end
