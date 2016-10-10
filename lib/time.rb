class Time

attr_reader :time

def time
@time=Time.now
@time+=(60*60)
@time.strftime('%H:%M')
end


end
