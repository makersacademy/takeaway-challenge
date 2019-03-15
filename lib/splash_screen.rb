# Splachscreen

def animation
  animation = ['welcome.txt', 'slice1.txt', 'slice2.txt', 'baby.txt']
  where = 0
  while where != 4
    system 'clear'
    banner = File.open(animation[where]).read
    puts banner
    sleep 1
    where += 1
  end
  print_header
end

def print_header
  system 'clear'
  puts '-' * 61
  puts '|'.ljust(22) + "Slice, slice baby".center(10) + "|".rjust(22)
  puts '-' * 61
end
