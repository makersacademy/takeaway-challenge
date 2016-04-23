require 'shop'
describe Shop do
  it 'starts with an empty order' do
    expect(subject.order).to be_empty
  end

  it 'starts with a checkout of 0' do
    expect(subject.checkout).to eq 0
  end

  it 'adds items to the order' do
    expect(subject.add("Muna chicken", 4.5)).to eq ({"Muna chicken" => 4.5})
  end

  it "allows the customer to remove itmes from the order" do
    subject.remove("dish")
    expect(subject.order).not_to include "dish"
  end

  # let(:menu) {double :menu}
   it 'shows the menu to the customers' do
    # allow(menu).to receive(:list).and_return(list)
    expect(subject.show_menu("menu")).to eq "menu"
  end
end
