require 'net/http'
require 'httparty'

def get_number_of_correct_responses(address)
	HTTParty::Basement.default_options.update(verify: false)
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
	puts "sending " 
	puts body.to_json;
	response = HTTParty.post(address +"/", :body => {
		:problem => problem
		}.to_json,:headers => { 'Content-Type' => 'application/json' })
	if (response.code >= 500)
		raise ("one 500 reponse")
	end
	puts response
	result = JSON.parse(response.body)["result"]
	if (result == expectation) 	
		return 1;
	end
	return 0
end