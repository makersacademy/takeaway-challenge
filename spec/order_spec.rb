require 'order'

describe Order do
  it 'has an initial empty list of dishes' do
    expect(subject.order_dishes).to eq([])
  end

  it 'menu has 5 items' do
    expect(subject.menu_items.length).to eq(5)
  end

  it 'can order 1 pizza' do
    subject.select_dish("pizza")
    expect(subject.order_dishes).to eq(["pizza"])
  end

  it 'can order 1 pizza and 1 coffee' do
    subject.select_dish("pizza")
    subject.select_dish("coffee")
    expect(subject.order_dishes).to eq(["pizza", "coffee"])
  end

  it 'has an initial empty final order' do
    expect(subject.final_order).to eq([])
  end

  # it 'has a list of the chosen dishes with their quantities' do
  #   subject.select_dish("pizza")
  #   subject.select_dish("coffee")
  #   subject.select_dish("coffee")
  #   expect(subject.final_order_compile).to eq({"pizza" => 1,"coffee" => 2})
  # end

  # it 'has a list of the chosen dishes with their quantities and total cost' do
  #   subject.select_dish("pizza")
  #   subject.select_dish("coffee")
  #   subject.select_dish("coffee")
  #   expect(subject.final_order_compile).to eq({"pizza" => 1,"coffee" => 2, "total cost" => 14})
  # end
end
