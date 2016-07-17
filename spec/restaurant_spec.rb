require 'restaurant'

  describe Restaurant do

    it 'should be able to show the customer a menu including prices' do
      takeaway = Restaurant.new
      expect(subject.show_menu).to eq subject.menu
end

end
