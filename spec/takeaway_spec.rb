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

end
