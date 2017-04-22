require 'listofdishes'

describe ListOfDishes do

  let(:dish_1) { double :dish, name: 'Fruit basket', price: 10.99 }
  let(:dish_2) { double :dish, name: 'Salad Nicoise', price: 14.99 }
  let(:listofdishes) { described_class.new([dish_1, dish_2]) }


  it 'prints a list of dishes' do
    expect(listofdishes.print_list)
    .to eq "#{dish_1.name} - #{dish_1.price}\n#{dish_2.name} - #{dish_2.price}"
  end


end
