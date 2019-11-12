require 'menu'
require 'Takeaway'
describe Menu do
  let(:list1) { {"rice"=>1.50, "pasta"=>6.50, "pizza"=>7.50} }
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with price
   describe "#view_list" do
    it 'displays the list of the dishes with the prices' do
     expect(subject.view_list).to eq list1
    end
   end
end
