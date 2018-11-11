require 'takeaway'

describe Takeaway do

  describe '#view_menu' do

    it 'shows the customer a list of dishes with prices' do
      menu = double(:menu, view_dishes: { "1 piece chicken meal" => 4.49 })
      takeaway = Takeaway.new(menu)
      expect(menu).to receive(:view_dishes)
      takeaway.view_menu
    end
  end
end
