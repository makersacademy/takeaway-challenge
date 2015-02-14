class Customer
  
  def call(takeaway)
    print "Ring, ring"; sleep(2); print ", ring, ring"; sleep(2); print "...\n"
    takeaway.take_call_from(self)
  end

end