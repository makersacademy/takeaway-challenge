require 'list'

describe List do

  subject(:list) { described_class.new}
  let(:dish1) {double 'Dish', details: "dish1 - 11 - true"}
  let(:dish2) {double 'Dish', details: "dish2 - 12 - true"}

  it 'responds to add_list' do
    expect(list).to respond_to(:add_list)
  end

  it 'responds to show_dishes' do
    expect(list).to respond_to(:show_dishes)
  end

  it 'shows a list of dishes with prices' do
    mock_list = { 1 => dish1, 2 => dish2}
    list.add_list(mock_list)
    expect { list.show_dishes }.to output("1: #{dish1.details}\n2: #{dish2.details}\n").to_stdout
  end

  it 'responds to select_dishes' do
    expect(list).to respond_to(:select_dishes).with(1).argument
  end

  describe '#select_dishes' do
    context 'when passed correct dishes' do
      it 'raises no error' do 
        expect { list.select_dishes(['dish1', 'dish2']) }.not_to raise_error
      end

      it 'returns an array of selected dishes' do
        mock_list = { 1 => dish1, 2 => dish2}
        list.add_list(mock_list)
        expect(list.select_dishes([1,2])).to eq([dish1,dish2])
      end
    end
  end

end