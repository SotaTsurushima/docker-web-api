class User < ApplicationRecord
  require "net/http"

  def self.create_random_user 
    uri = "https://randomuser.me/api/?results=5,format=json"
    response = Net::HTTP.get_response(URI.parse(uri)).body
    res = JSON.parse(response)

    title = res["results"][0]["name"]["title"]
    first = res["results"][0]["name"]["first"]
    last = res["results"][0]["name"]["last"]
    name = "#{title + first + last}"
    
    return name
  end
end
