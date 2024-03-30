module Goods::Raku extend self
  def batch
    # later it should be done depending on what I write

    # t['itemName']
    # t['itemPrice']
    # t['reviewAverage']
    # t['mediumImageUrls'](存在すれば)
    # 20件取得する
    @test = RakutenWebService::Ichiba::Item.search(keyword: "IT 本")
    for t in @test
      binding.pry
      puts t
    end
    
  end

  private

  # def search(tag, latest_id)
  #   # 最初であれば10件だけ取っておく
  #   tweets = if latest_id.nil? 
  #             @client.search("##{tag}", locale: 'ja', exclude: 'retweets', result_type: 'recent', since_id: latest_id).collect.take(10)
  #           else
  #             @client.search("##{tag}", locale: 'ja', exclude: 'retweets', result_type: 'recent', since_id: latest_id).collect
  #           end
  #   tweets.each_with_index do | tweet, idx | 
  #     p idx
  #     tweet.media.each do | media |
  #       tw = Sns.find_or_create_by(sns_type_id: 2, post_id: tweet.id.to_s) do | sns |
  #         sns.remote_image_url = media.media_url.to_s
  #         sns.post_url = tweet.url.to_s
  #         sns.post_date = tweet.created_at
  #       end
  #     end
  #   end
  # end

  # def config
  #   Twitter::REST::Client.new do |config|
  #     config.consumer_key     = ENV['TWITTER_CONSUMER_KEY']
  #     config.consumer_secret  = ENV['TWITTER_CONSUMER_SECRET']
  #   end
  # end
end