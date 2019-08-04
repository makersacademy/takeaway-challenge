require 'takeaway'

describe Takeaway do

  let(:name) {double "name"}
  let(:price) {double "price"}

  it 'displays the menu' do
    allow(subject).to receive(:show_menu) do |name, price|
    expect(name , price).to eq(name, price)
    end
  end
end
