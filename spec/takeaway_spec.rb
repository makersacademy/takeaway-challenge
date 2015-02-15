require 'takeaway'

describe 'Takeaway' do

  let(:takeaway) {Takeaway.new}



  it 'can have a dish added to its list' do
    dish = double :dish
    takeaway.add_dish(dish)
    expect(takeaway.dishlist).to eq [dish]
  end

  it 'Returns a formatted string of each Dish' do

    fish = double :dish, name: 'Fish', price: 7.50
    burger = double :dish, name: 'Burger', price: 6.00
    steak = double :dish, name: 'Steak', price: 11.50
    takeaway.add_dish(fish)
    takeaway.add_dish(burger)
    takeaway.add_dish(steak)

    # Output should be:
    #
    # Fish    --   7.50
    # Burger  --   6.00
    # Steak   --  11.50


    expect(takeaway.menu).to eq "Fish    --   7.50\nBurger  --   6.00\nSteak   --  11.50\n"
  end

  it 'takes a dish order, either incrementing its quantity by 1 or setting to the amount specified' do

    fish = double :dish, quantity: 2
    steak = double :dish, quantity: 1
    takeaway.add_dish(fish)
    takeaway.add_dish(steak)

    order_amount = 2

    expect(fish).to receive(:set_quantity).with(order_amount)
    expect(steak).to receive(:add)

    takeaway.order(fish,2)
    takeaway.order(steak)

    expect(fish.quantity).to eq 2
    expect(steak.quantity).to eq 1
  end





end