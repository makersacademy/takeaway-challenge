require 'order_line'

describe OrderLine do

  subject(:orderline){described_class.new(dish: dish1, qty: 2)}
  let(:dish1){double :Dish, name: "dish1", price: 10}

  it{is_expected.to respond_to(:dish, :qty, :total)}

  describe '#new' do
    it {expect(orderline.total).to eq(dish1.price * 2)}
    it {expect(orderline.dish).to eq(dish1.name)}
    it {expect(orderline.qty).to eq(2)}
  end
end
