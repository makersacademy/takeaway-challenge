require './lib/menu'

describe Menu do
  
  describe "#dishes" do
    it "expects there to be a menu list on initialization" do
      expect(subject.dishes).not_to be_empty
    end
  end

  describe '#read_menu' do
    specify { expect { subject.read_menu }.to output.to_stdout }
  end

end
