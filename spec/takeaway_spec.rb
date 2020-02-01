require 'takeaway'
describe TakeAway do

  describe '#show_menu' do
    it 'prints a list of dishes available' do
      expect(subject.show_menu).to eq({ "burger" => 5, "fries" => 3, "shake" => 2 })
    end
  end

end
