require 'text'

describe Text do

  let(:text_double) { double :text }
  let(:text_class_double) { double :text_class, new: text_double }

  describe '#list_items' do
    it 'returns a formatted list of items' do
      items = [{:name=>"Bambi", :quantity=>1}, {:name=>"Cheeeseburger", :quantity=>1}, {:name=>"Truffle Polenta Chips", :quantity=>2}, {:name=>"Corona", :quantity=>3}]
      text = Text.new(items, 36.0)
      expect(text.list_items(items)).to eq "Bambi x 1\nCheeeseburger x 1\nTruffle Polenta Chips x 2\nCorona x 3\n"
    end
  end

end