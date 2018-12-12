require 'net/http'
require 'httparty'

def get_number_of_correct_responses(address)
	begin  
		return test_all(address)
	rescue
		return 0;
	end
end

def test_all(address)
	correct = 0;	
	begin
		problems  = Problems.get_problems();
		problems.each do |problem|
			puts problem.equation
			puts problem.answer
   			correct += single_test(address,problem.equation, problem.answer);	
		end
		# correct += single_test(address, "3 + 4", 7);
		# correct += single_test(address, "5 + 2", 7);
		# correct += single_test(address, "3 + 3", 6);
		# correct += single_test(address, "100 + 2", 102);
		return correct
	rescue 
		puts "here"
		puts "Team : " + address + " blew up"
		return 0;
	end	
end

def single_test(address, problem, expectation)
	body = {			
			problem: problem
	};
	response = HTTParty.post(address +"/", body)
	if (response.code > 500)
		raise ("one 500 reponse")
	end
	puts response
	result = JSON.parse(response.body)["result"]
	if (result == expectation) 	
		return 1;
	end
	return 0
end