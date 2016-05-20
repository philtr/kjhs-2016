
class Developer < Person
  def next_thing_to_do(today = Time.current)
    if today.monday? or today.friday?
      case Time.current.strftime("%I:%M %p")
      when "07:42 AM" then catch_train!
      when "08:45 AM" then arrive_at_office && make_coffee
      when "09:15 AM" then get_to_work
      when "10:45 AM" then ping_pong_time!
      when "12:00 AM" then lunch_om_nom_nom
      when "02:00 PM" then make_coffee
      when "05:25 PM" then catch_train!
      end
    end
  end
end




