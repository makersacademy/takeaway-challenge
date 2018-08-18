describe "ordering a dish" do

  let(:order) { Orders.new }
  
  it "will display a list of dishes with prices" do
    expect(order.view_menu).not_to eq(nil)
  end

end