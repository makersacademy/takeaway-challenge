require 'order'

describe CustomerOrder do
  it {is_expected.to respond_to :see_order}

  it {is_expected.to respond_to :total}

  it 'shows the sum of the varios dishes in the order' do
    list = List.new
    menu = { 'apple' => 3 }
    choice = list.apple
    expect(subject.see_order).to eq(choice)
  end

  it 'shows the total of the order' do
    list = List.new
    menu = { 'apple' => 3 }
    choice = list.apple
    expect(subject.total).to eq(choice.values.sum)
  end
end