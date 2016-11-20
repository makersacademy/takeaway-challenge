require 'takeaway'

describe TakeAway do

  subject (:takeaway) {described_class.new}
  let (:twilio) {double :twilio}

  describe '#view_menu' do
    it 'should respond to view_menu' do
      expect(takeaway).to respond_to(:view_menu)
    end

    it 'returns a list of dishes and prices' do
      expect(takeaway.view_menu).to include("chicken carbonara")
    end

  end

  describe '#order' do
    it 'should respond to order' do
      expect(takeaway).to respond_to(:order)
    end

    it 'should save selected dishes' do
      expect(takeaway.order("chicken carbonara")).to eq ["chicken carbonara"]
    end

    it 'should not allow meals to be selected that are not on the menu' do
      expect{takeaway.order("pizza")}.to raise_error "Selection not available"
    end

    it 'allows multiple orders of the same item' do
      takeaway.order("cheese")
      takeaway.order("cheese")
      expect(takeaway.new_order).to include("cheese", "cheese")
    end
  end

  describe '#check_total' do
    it 'should respond to check_total' do
      expect(takeaway).to respond_to(:check_total)
    end

    it 'should total the prices of all the selected dishes' do
      takeaway.order("chicken carbonara")
      takeaway.order("garlic prawn")
      expect(takeaway.check_total).to eq 24
    end

    it 'should total mutliple same items correclty' do
      takeaway.order("cheese")
      takeaway.order("cheese")
      expect(takeaway.check_total).to eq 10
    end
  end

end
