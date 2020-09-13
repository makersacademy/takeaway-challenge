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
  end

  it 'selects several dishes from list of dishes' do
    ordering.add(:Coffee, 1) # placing order for context
    ordering.add(:Sandwich, 1) # placing order fot context
    expect(ordering.chosen_dishes).to eq(chosen_dishes)
  end

  it 'does not allow to add dishes that are not in the list' do
    # ref1 needs to know about Menu
    allow(menu).to receive(:dish_available?).with(:sundaes).and_return(false)
    # new method dish_available? boolean, to check if ordered dish is in the list of dishes
    expect { ordering.add(:sundaes, 3) }.to raise_error "We do not have any Sundaes in the list"
    # if not available, throws above error
  end
end

# ref1 Class Ordering needs to know about Class Menu to be able to work
# ref1 using dependency injection
#