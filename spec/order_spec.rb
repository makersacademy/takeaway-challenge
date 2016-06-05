require 'order'

describe Order do

  subject(:order) {described_class.new}
  let(:menu) {double (:menu)}

  it { is_expected.to have_attributes(:current_order => [], :total => 0) }

  it 'responds to add_dish' do
    expect(subject).to respond_to(:add_dish).with(2).arguments
  end

  it 'responds to check_total' do
    expect(subject).to respond_to(:check_total)
  end

    describe "#add_dish" do
      it "should add items to current order" do
        expect {subject.add_dish("Pudweiser", 1)}.to change {subject.total}.by 4
      end
      it "raises an error if dish not inlcuded in menu" do
        expect {subject.add_dish("Lettuce")}.to raise_error("Unfortuantely, we do not have this dish.")
      end
    end

end