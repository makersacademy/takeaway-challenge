require 'dish'

describe Dish do
  it 'will include Thai tofu' do
    dishes = Dish.new
    expect(dishes.print.to_s).to include('thai tofu')
  end

end
