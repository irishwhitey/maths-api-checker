require 'net/http'
require 'httparty'

def get_number_of_correct_responses(address)
	body = {			
			augend: 3,
			addend: 4
		};
	response = HTTParty.post(address +"/ADD/", body)
	puts response.body
	if (JSON.parse(response.body)["result"] == 7) 	
		return 1;
	end
	return 0;
end