require 'takeaway'

describe 'Takeaway' do

  let(:takeaway) {Takeaway.new}



  it 'can have a dish added to its list' do
    dish = double :dish
    takeaway.add_dish(dish)
    expect(takeaway.dishlist).to eq [dish]
  end

  it 'Returns a formatted string of each Dish' do

    # Output should be:
    #
    # Fish    --  7.50
    # Burger  --  6.00
    # Steak   --  9.50


    fish = double :dish, name: 'Fish', price: 7.50
    burger = double :dish, name: 'Burger', price: 6.00
    steak = double :dish, name: 'Steak', price: 9.50
    takeaway.add_dish(fish)
    takeaway.add_dish(burger)
    takeaway.add_dish(steak)

    expect(takeaway.menu).to eq "Fish    --  7.50\nBurger  --  6.00\nSteak   --  9.50\n"
  end





end