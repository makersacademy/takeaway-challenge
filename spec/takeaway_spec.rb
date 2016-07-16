require 'takeaway'

describe Takeaway do
  it 'respodns to #show_menu' do
    expect(subject).to respond_to(:show_menu)
  end
  describe '#show_menu' do
    let(:menu) { {:dish => :price} }
    specify { expect{subject.show_menu}.to output("#{:dish}.....#{menu[:dish]}\n").to_stdout}
  end

  describe "#order" do
    let(:dish) {double :dish}
    let(:number) {double :number}
    it 'accepts dish and number as arguments' do
      expect(subject).to respond_to(:order).with(2).arguments
    end

    it "returns order made" do
      expect(subject.order(dish, number)).to eq [[number, dish]]
    end
  end

end
