require 'dishes'

describe Dishes do
  it 'will include Thai tofu' do
    dishes = Dishes.new
    expect(dishes.print.to_s).to include('thai tofu')
  end
end
