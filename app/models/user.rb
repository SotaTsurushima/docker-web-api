class User < ApplicationRecord
  require "net/http"

  def self.get_random_user 
    uri = "https://randomuser.me/api/?results=5,format=json"
    response = Net::HTTP.get_response(URI.parse(uri)).body
    res = JSON.parse(response)
    hash_value = res["results"][0]["picture"]
    return hash_value
  end
  
end
