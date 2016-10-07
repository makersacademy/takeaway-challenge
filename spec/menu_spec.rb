require 'menu'

describe Menu do

  subject(:menu) {described_class.new}
  let(:dish) {double :dish}
  let(:price) {double :price}

  describe "#initialize" do
    it 'checks to make sure the has is not empty' do
      expect(menu.full_list).not_to be_empty
    end
  end

  describe "#full_list" do
    it 'display list of orderable items' do
      expect{menu.full_list}.to output.to_stdout
    end
  end

  describe "#on_list?" do
    it 'returns an error if order item is not on the list' do
      item = "input"
      expect{menu.on_list?(item)}.to raise_error "Choice not availble"
    end
  end


end
