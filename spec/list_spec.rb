require 'list'

describe List do

  subject(:list) { described_class.new}
  let(:dish1) {double 'Dish', order: 1, name: 'dish1', price: 11}
  let(:dish2) {double 'Dish', order: 2, name: 'dish2', price: 12}

  it 'responds to add_list' do
    expect(list).to respond_to(:add_list)
  end

  it 'responds to show_dishes' do
    expect(list).to respond_to(:show_dishes)
  end

  it 'shows a list of dishes with prices' do
    mock_list = { dish1.order => {name: dish1.name, price: dish1.price}, dish2.order => {name: dish2.name, price: dish2.price}}
    list.add_list(mock_list)
    p list.show_dishes
    expect { list.show_dishes }.to output("#{dish1.order}: #{dish1.name} - #{dish1.price}\n#{dish2.order}: #{dish2.name} - #{dish2.price}\n").to_stdout
  end

  it 'responds to select_dishes' do
    expect(list).to respond_to(:select_dishes).with(1..10).arguments
  end

  describe '#select_dishes' do
    context 'when passed correct dishes' do
      it 'raises no error' do 
        expect { list.select_dishes('dish1', 'dish2') }.not_to raise_error
      end
    end
  end

end