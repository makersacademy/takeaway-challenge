class Text_message

    def delivery_time
        current_time = Time.now 
        del_time = current_time + 1*60*60
        return del_time
    end
end

