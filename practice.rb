def read_char
  begin
    old_state = `stty -g`
    system "stty raw -echo"
    c = STDIN.getc.chr
    # gather next two characters of special keys
    if(c=="\e")
      extra_thread = Thread.new{
        c = c + STDIN.getc.chr
      }
      extra_thread.join(0.00001)
      extra_thread.kill
    end
  # handle error messages
  rescue => ex
    puts "#{ex.class}: #{ex.message}"
    puts ex.backtrace
  # make sure system error does not hang app
  ensure
    system "stty #{old_state}"
  end
  return c
end

# takes a single character command
def show_single_key
    c = read_char
  case c
  when "\e"
    exit
  when "\177"
    puts "BACKSPACE"
  when /^.$/
  puts "SINGLE CHAR HIT: #{c} otherwise #{c.inspect}"
  else
    puts "Key not recognised"
  end
end

show_single_key while(true)
