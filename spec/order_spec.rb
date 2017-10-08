require 'order'

class FakeMenu

  attr_reader :dishes

  def initialize
    @dishes = { 'Pizza' => 8,
                'Pasta' => 6,
                'Salad' => 8,
                'Chips' => 3,
                'Burger'=> 9
              }
  end
end

describe Order do

  subject(:order) { described_class.new(FakeMenu.new) }

  it 'should be initialised with an empty basket' do
    expect(order.basket).to be_empty
  end

end
