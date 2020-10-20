require 'pg'

begin
  
  con = PG.connect( dbname: 'takeaway_orders' )
    
  con.exec "INSERT INTO takeaways (takeaway) VALUES ('#{$takeaway}');"

rescue PG::Error => e

  puts e.message

ensure

  con.close if con

end