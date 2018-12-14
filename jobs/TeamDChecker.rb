# Populate the graph with some random points
total =0;
SCHEDULER.every '10s' do   
  puts "Team D: running checker"
  new_total = get_number_of_correct_responses("http://localhost:8080") 
  send_event('convergenceD', { current: new_total})
  puts "Team D: Scored" + new_total.to_s
  total = total + new_total
  puts "Team D: Grand Total" + total.to_s
  send_event('convergenceDTotal', { current: total})
end
