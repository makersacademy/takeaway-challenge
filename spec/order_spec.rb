require 'order'

describe CustomerOrder do
  
  it {is_expected.to respond_to :total}

  xit 'shows the sum of the various dishes in the order' do
    list = List.new
    menu = { 'apple' => 3 }
    choice = list.apple
    expect(subject.see_order).to eq(choice)
  end

  xit 'shows the total of the order' do
    list = List.new
    menu = { 'apple' => 3 }
    choice = list.apple
    expect(subject.total).to eq(choice.values.sum)
  end

  it {is_expected.to respond_to :order_maker}
end