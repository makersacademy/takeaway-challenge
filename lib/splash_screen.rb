def splash
  animation = ['welcome.txt', 'slice1.txt', 'slice2.txt', 'baby.txt']
  where = 0
  while where != 4
    system 'clear'
    banner = File.open(animation[where]).read
    puts banner
    sleep 1
    where += 1
  end
end

splash
