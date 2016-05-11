require "faraday"
require "json"

BASE_URL = "http://localhost:3000"
API_KEY ="50e2a832746ae9ccec5ba5b4cba06c4b14ac9d5a129986ba3859de3c4678584a"

conn = Faraday.new(url: BASE_URL) do |faraday|
  faraday.request  :url_encoded             # form-encode POST params
  faraday.response :logger                  # log requests to STDOUT
  faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
end

response = conn.get "/api/v1/campaigns", {api_key: API_KEY}

campaigns = JSON.parse(response.body)

campaigns.each do |campaign|
  puts campaign["title"]

end
