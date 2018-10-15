require './takeaway'

describe Takeaway do

  let (:takeaway) { Takeaway.new }
  let (:meal_1) { double :meal, :number => 1, :name => "Pizza", :price => 10}
  let (:meal_2) { double :meal, :number => 2, :name => "Fries", :price => 2 }

  it 'prints a list of dishes with prices' do
    expect { subject.display_menu }.to output("'Go-Away' - Take-Away Menu\n1: Pizza, £10\n      ---\n      \n2: Fries, £2\n      ---\n      \n3: Garlic Bread, £3\n      ---\n      \n").to_stdout
  end

  it 'allows me to select dishes' do
    allow($stdin).to receive(:gets).and_return(1, 6)
    subject.choose_meals(1)
    expect(subject.order).to eq [1]
  end

  it 'creates a record of the order' do
    order_1 = [1, 2]
    subject.collate_check(order_1)
    expect(subject.check[0].name).to eq "Pizza"
  end
  
  it 'allows me to order several dishes & check total equals sum of their prices' do
    @chek = [meal_1, meal_2]
    expect { subject.display_order(@chek) }.to output("Your order was as follows:\n1: Pizza, £10\n2: Fries, £2\nYour order will cost a total of £12\n").to_stdout
  end

  it 'allows me to order several dishes & check total equals sum of their prices' do
    @chek = [meal_1, meal_2]
    subject.display_order(@chek)
    expect(subject.total).to eq 12
  end

  it 'sends a confirmation text' do
    expect(subject.confirm_order).not_to eq nil
  end

end

describe Menu do

  it 'creates an object with a meal' do
    @menu = Menu.new
    expect(subject.meals[0].number).to eq 1
    expect(subject.meals[1].number).to eq 2
    expect(subject.meals[2].number).to eq 3
    expect(subject.meals[0].name).to eq "Pizza"
    expect(subject.meals[1].name).to eq "Fries"
    expect(subject.meals[2].name).to eq "Garlic Bread"
    expect(subject.meals[0].price).to eq 10
    expect(subject.meals[1].price).to eq 2
    expect(subject.meals[2].price).to eq 3
  end

end

describe Meal do

  let (:meal) { Meal.new(1, "Pizza", 10) }
  it 'allows me to create a food object' do
    expect(meal.number).to eq 1
    expect(meal.name).to eq "Pizza"
    expect(meal.price).to eq 10
  end

end