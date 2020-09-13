require 'Ordering'
require 'Menu'

describe Ordering do
  subject(:ordering) { Ordering.new(menu) } # ref1

  let(:menu) { double(:menu) } # inject menu here ref1

  let(:chosen_dishes) do
    {
        Coffee: 1,
        Sandwich: 1
    }
  end

  before do # creating a context to make code work before other tests
    allow(menu).to receive(:dish_available?).with(:Coffee).and_return(true)
    allow(menu).to receive(:dish_available?).with(:Sandwich).and_return(true)

    allow(menu).to receive(:price).with(:Coffee).and_return(0.99)
    allow(menu).to receive(:price).with(:Coffee).and_return(3.99)
  end

  it 'selects several dishes from list of dishes' do
    create_new_order
    expect(ordering.chosen_dishes).to eq(chosen_dishes)
  end

  it 'does not allow to add dishes that are not in the list' do
    # ref1 needs to know about Menu
    allow(menu).to receive(:dish_available?).with(:sundaes).and_return(false)
    # new method dish_available? boolean, to check if ordered dish is in the list of dishes
    expect { ordering.add(:sundaes, 3) }.to raise_error "We do not have any Sundaes in the list"
    # if not available, throws above error
  end

  it 'calculates sum for ordering' do
    create_new_order
    sum = 4.98
    expect(ordering.sum).to eq(sum)
  end

  def create_new_order
    ordering.add(:Coffee, 1) # placing order for context
    ordering.add(:Sandwich, 1) # placing order fot context
  end
end

# ref1 Class Ordering needs to know about Class Menu to be able to work
# ref1 using dependency injection
#