class User < ApplicationRecord
  require "net/http"

  def self.create_random_user 
    uri = "https://randomuser.me/api/?results=5,format=json"
    response = Net::HTTP.get_response(URI.parse(uri)).body
    res = JSON.parse(response)

    hash_name = []
    hash_name.push(res["results"][0]["name"]["title"])
    hash_name.push(res["results"][0]["name"]["first"])
    hash_name.push(res["results"][0]["name"]["last"])
    name = hash_name.join(' ')
    
    return name
  end
end
