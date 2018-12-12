# Populate the graph with some random points
total =0;
SCHEDULER.every '10s' do 
  
  puts "running team A checker"
  new_total = get_number_of_correct_responses("http://localhost:8080") 

  send_event('convergenceA', { current: new_total})
  total = total + new_total
  send_event('convergenceATotal', { current: total})
end
