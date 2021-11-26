require "takeaway"

describe Takeaway do

  let(:curry) { double :curry, :name => "curry", :price => 8.5 }
  let(:naan) { double :naan, :name => "naan", :price => 3 }
  let(:menu) { double :menu, :dishes => [curry, naan] }

  it "should be able to show the menu" do
    allow(menu).to receive(:show).and_return("curry, £8.5\nnaan, £3\n")
    expect(subject.show_menu).to eq("curry, £8.5\nnaan, £3\n")
  end

end
