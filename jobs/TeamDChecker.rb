# Populate the graph with some random points
total =0;
SCHEDULER.every '10s' do 
  
  puts "running team D checker"
  new_total = get_number_of_correct_responses("http://localhost:8080") 

  send_event('convergenceD', { current: new_total})
  total = total + new_total
  send_event('convergenceDTotal', { current: total})
end
