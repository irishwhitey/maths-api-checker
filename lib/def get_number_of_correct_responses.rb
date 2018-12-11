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
		correct += single_test(address, "3 + 4", 7);
		correct += single_test(address, "5 + 2", 7);
		correct += single_test(address, "3 + 3", 6);
		correct += single_test(address, "100 + 2", 102);
		return correct
	rescue
		return 0;
	end	
end

def single_test(address, problem, expectation)
	body = {			
			problem: problem
	};
	response = HTTParty.post(address +"/", body)
	if (response.code != 200)
		raise ("none 200 reponse")
	end
	result = JSON.parse(response.body)["result"]
	if (result == expectation) 	
		return 1;
	end
	return 0
end