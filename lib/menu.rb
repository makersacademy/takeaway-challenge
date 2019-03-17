require_relative 'takeaway'

# Menu class
class TakeawayMenu
  def initialize(takeaway = Takeaway.new)
    @takeaway = takeaway
    @contents = 1
    # print_menu(1)
  end

  def print_menu(menu)
    print_header
    fetch_contents(menu)
    @contents.each_with_index do |item, index|
      puts "| #{index + 1}. #{item}".ljust(81) + "|"
    end
    puts "-" * 82
  end

  def fetch_contents(contents)
    @contents = @takeaway.show(contents)
  end

  def print_header
    system 'clear'
    puts "-" * 82
    puts "|" + "Slice, Slice Baby!".center(80) + "|"
    puts "-" * 82
  end
end

# Handles the single key strokes
class Navigation
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
    when "\e" # esc key
      exit
    when "\177" # backspace key
      puts "BACKSPACE"
    when /^.$/ # any other single key
      puts "SINGLE CHAR HIT: #{c} otherwise #{c.inspect}"
    else # error handling
      puts "Key not recognised"
    end
  end
end
