# Populate the graph with some random points
total =0;
SCHEDULER.every '10s' do   
  puts "Team B: running checker"
  new_total = get_number_of_correct_responses("http://localhost:8080") 
  send_event('convergenceB', { current: new_total})
  puts "Team B: Scored" + new_total.to_s
  total = total + new_total
  puts "Team B: Grand Total" + total.to_s
  send_event('convergenceBTotal', { current: total})
end
