describe "Users Stories" do

subject(:takeaway){ Takeaway.new }
let(:menu) { double :menu }
  # User Story 1:
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
    it "should return a list of dishes with prices" do
      allow(takeaway).to receive(:get_menu).and_return(menu)
      expect(takeaway.get_menu).to eq menu
    end
end
