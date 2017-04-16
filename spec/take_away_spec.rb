require 'takeaway'

describe takeaway do
  let (:takeaway) {Takeaway.new}

  context " menu " do
    it " dishes should have price "
      expect(takeaway.price("pizza")).to eq(2)

  context " basket "

    it " can be emty " do
      expect(Takeaway.new.basket).to be_empty
    end

    it " can have an item "
      takeaway.add_to_basket("pizza")
      expect(takeaway.basket).not_to be be_empty
    end
  