# Populate the graph with some random points
points = []


(1..2).each do |i|
  points << { x: i, y: 0 }
end
last_x = points.last[:x]

SCHEDULER.every '2s' do
  points.shift
  last_x += 1

  points << { x: last_x, y: get_number_of_correct_responses("http://localhost:8080") }

  send_event('convergenceA', points: points)
end