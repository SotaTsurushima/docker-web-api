class User < ApplicationRecord
  require "net/http"

  def self.create_random_user 
    uri = "https://randomuser.me/api/?results=5,format=json"
    response = Net::HTTP.get_response(URI.parse(uri)).body
    res = JSON.parse(response)

    user_data = []
    user_name = []
    
    # user_name作成
    user_name.push(res["results"][0]["name"]["title"])
    user_name.push(res["results"][0]["name"]["first"])
    user_name.push(res["results"][0]["name"]["last"])
    user_name = user_name.join(' ')
    user_data.push(user_name)

    # 写真URLの作成
    user_data.push(res["results"][0]["picture"]["medium"])


    binding.pry
    # 写真URLの追加

    return name
  end
end
