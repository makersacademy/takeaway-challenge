require 'customer'

describe Customer do

  let (:takeaway) { double(:takeaway, menu: {:margherita => 6.5, :romana => 7.2}) }

  before :each do
    subject.add_item(takeaway, :margherita)
    subject.add_item(takeaway, :romana)
  end



end
