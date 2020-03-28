require 'order'

describe Order do
  it {is_expected.to respond_to :dish_choice}

  it {is_expected.to respond_to :order_total}

  it 'shows the sum of the varios dishes in the order' do
    list = List.new
    menu = { 'apple' => 3 }
    choice = list.apple
    expect(subject.dish_choice).to eq(choice)
  end

  it 'shows the total of the order' do
    list = List.new
    menu = { 'apple' => 3 }
    choice = list.apple
    expect(subject.order_total).to eq(choice.values.sum)
  end
end