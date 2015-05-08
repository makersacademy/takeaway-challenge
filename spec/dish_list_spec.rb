require 'dish_list'

describe DishList do
  let(:dish_list) { described_class.new }
  let(:chicken) { double :dish, order_code: 'A1' }
  let(:beef) { double :dish, order_code: 'B2' }

  it 'holds a list of the dishes available from the restaurant' do
    expect(dish_list).to respond_to :list
  end

  it 'can be queried with an order code and returns the relevant dish' do
    allow(dish_list).to receive(:list).and_return([chicken, beef])
    expect(dish_list.lookup('B2')).to eq beef
  end

  it 'will return an error if an incorrect item code is given' do
    err_msg = 'No dish found with that order code'
    expect { dish_list.lookup('D123') }.to raise_error err_msg
  end

end