require 'takeaway'

describe Takeaway do
  it 'is an instance of a takeaway class' do
    expect(subject).to be_an_instance_of Takeaway
  end

  describe "#show_menu" do
    it 'shows the menu' do
      expect(subject).to respond_to(:show_menu)
    end
  end

  describe "#add_item" do
    it { expect(subject).to respond_to(:add_item) }

    it 'adds item to order' do
      expect { subject.add_item('fish', 1) }. to change { subject.order }
    end
  end

end
