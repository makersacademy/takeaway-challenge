class Customer

  attr_accessor :name, :phone_number

  def initialize(name='Phil Brockwell')
    @name = name
    @phone_number = '+447737932693'
  end
  
  def call(takeaway)
    print "Ring, ring"; sleep(2); print ", ring, ring"; sleep(2); print "...\n"; sleep(2)
    takeaway.take_call_from(self)
  end

end