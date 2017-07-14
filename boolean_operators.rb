def pizza_for_food_human?(event, sapa_availablity)
  event == 'CS Night' or event == 'Dev Friday' and not sapa_availablity
end


def pizza_for_food_cstyle?(event, sapa_availablity)
  event == 'CS Night' || event == 'Dev Friday' && !sapa_availability
end

puts pizza_for_food_human?('CS Night', true)
puts pizza_for_food_cstyle?('CS Night', true)


