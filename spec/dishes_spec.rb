require 'dishes'

describe Dishes do
  subject(:dishes) { described_class.new }

  let(:list) do
    {
      "Chop Suey" => 15.99,
      "Thai Curry" => 11.99,
      "Singapore Noodles" => 9.99
    }
  end

  it 'is initialsed with a menu' do
    expect(dishes.list).to include(list)
  end

end
