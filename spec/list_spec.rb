require 'list'

describe List do

  subject(:list) { described_class.new}

  it 'responds to show_dishes' do
    expect(list).to respond_to(:show_dishes)
  end

  it 'shows a list of dishes with prices' do
    expect(list.show_dishes).to eq({dish1: 10, dish2: 11})
  end

  it 'responds to select_dishes' do
    expect(list).to respond_to(:select_dishes).with(1..10).arguments
  end

  it 'shows a list of dishes with prices' do
    expect { list.show_dishes }.to output("dish1: 10\ndish2: 11\n").to_stdout
  end

  describe '#select_dishes' do
    context 'when passed correct dishes' do
      it 'raises no error' do 
        expect { list.select_dishes('dish1', 'dish2') }.not_to raise_error
      end
    end
  end

end