class User < ApplicationRecord
  require "net/http"

  def self.get_random_user 
    uri = "https://randomuser.me/api/?results=5,format=json"
    response = Net::HTTP.get_response(URI.parse(uri))
    hash = JSON.parse(response.body)
    
    binding.pry
    
  end
  
end
