require 'menu'

describe Menu do
  let(:list1) { { "rice" => 1.50, "fries" => 2.50, "noodles" => 3.50, "pasta" => 6.50, "pizza" => 7.50 } }
  describe "#view_list" do
    it 'shows the list of dishes' do
      expect(subject.view_list).to eq list1
    end
  end
end
