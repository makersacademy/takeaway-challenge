class Customer
  
  def call(takeaway)
    print "Ring, ring"; sleep(2); print ", ring, ring"; sleep(2); print "...\n"; sleep(2)
    takeaway.take_call_from(self)
  end

end