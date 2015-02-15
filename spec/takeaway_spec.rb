require 'takeaway'

describe 'Takeaway' do

  let(:takeaway) {Takeaway.new}

  let(:fish) {double :dish, name: 'Fish', price: 7.50, quantity: 0}
  let(:burger) {double :dish, name: 'Burger', price: 6.25, quantity: 3}
  let(:steak) {double :dish, name: 'Steak', price: 11.50, quantity: 1}

  def populate_menu
    takeaway.add_dish(fish)
    takeaway.add_dish(burger)
    takeaway.add_dish(steak)
  end


  it 'can have a dish added to its list' do
    dish = double :dish
    takeaway.add_dish(dish)
    expect(takeaway.dishlist).to eq [dish]
  end

  it 'Returns a formatted string of each Dish' do

    populate_menu

    # Output should be:
    #
    # Fish    --   7.50
    # Burger  --   6.25
    # Steak   --  11.50


    expect(takeaway.menu).to eq "Fish    --   7.50\nBurger  --   6.25\nSteak   --  11.50\n"
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

  it 'raises an error if the expected total is not the expressed total' do

    # Why would place_order need to take an argument for expected price?
    # The price is set by the program..

    populate_menu

    # Fish    --   7.50
    # Burger  --   6.25
    # Steak   --  11.50

    # Ordering 3 burgers and 1 steak
    # Expected total is 30.25

    expect{takeaway.place_order(30.00)}.to raise_error 'That price is unexpected'

  end

  it "Formats a string 'Thank you! Your order was placed and will be delivered before.. when the order is processed" do

    # !! ** !!
    # Why does this pass even if I comment out the returning string?

    # Fish    --   7.50
    # Burger  --   6.25
    # Steak   --  11.50

    # Ordering 3 burgers and 1 steak
    # Expected total is 30.25
    populate_menu
    time = Time.new
    expect(takeaway).to receive(:order_success).and_return("Thank you! Your order was placed and will be delivered before #{(time.hour+1)%24}:#{time.min}")
    takeaway.place_order(30.25)

  end





end