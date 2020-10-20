require 'pg'

begin
 
  con = PG.connect( dbname: 'takeaways' )
  
  rs = con.exec "SELECT * FROM takeaways"

  rs each do |row|
    puts "%s %s" % [ row['id'], row['takeaway'] ]
  end

rescue PG::Error => Error

  puts e.message

ensure

  rs.clear if rs
  con.close if con

end