# Populate the graph with some random points
total =0;
SCHEDULER.every '10s' do   
  puts "running team B checker"
  new_total = get_number_of_correct_responses("http://localhost:8080") 

  send_event('convergenceB', { current: new_total})
  total = total + new_total
  send_event('convergenceBTotal', { current: total})
end