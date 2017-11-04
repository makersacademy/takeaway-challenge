class Menu

attr_reader :info

def initialize
  @info = {:Satay => 5, :RotiCanai => 9,:Kuih => 3,:NasiLemak => 10}
end

def read_menu
  puts
  puts "Malaysian Express - Authentic Malaysian"
  puts "1. Satay - $5.00"
  puts "2. RotiCanai - $9.00"
  puts "3. Kuih - $3.00"
  puts "4. Nasi Lemak - $10"
  return "Choose Option for your order!"
end


end
