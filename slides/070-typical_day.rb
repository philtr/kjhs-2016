
class Developer < Person
  def next_thing_to_do(today = Time.current)

    if today.monday? or today.friday?
      case today.strftime("%I:%M %p")
      when "07:42 AM" then catch_train!
      when "08:45 AM" then arrive_at_office && make_coffee
      when "09:15 AM" then get_to_work
      when "10:45 AM" then ping_pong_time!
      when "12:00 PM" then lunch_om_nom_nom
      when "02:00 PM" then make_coffee
      when "05:25 PM" then catch_train!
      end
    end

    if today.tuesday? or today.wednesday? or today.thursday?
      case today.strftime("%I:%M %p")
      when "07:30 AM" then arrive_craftwork && make_coffee
      when "07:45 AM" then get_to_work!
      when "09:30 AM" then break!
      when "12:00 PM" then lunch_om_nom_nom
      when "02:00 PM" then make_coffee
      when "04:00 PM" then leave_craftwork
      when "04:30 PM" then work_from_home
      when "05:45 PM" then done!
      end
    end
  end
end




