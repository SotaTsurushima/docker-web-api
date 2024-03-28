namespace :goods do
  desc "twitterのハッシュタグから画像を保存するタスク"
  task rakuten: :environment do
    puts "Hello"
    Goods::Raku.batch
  end
end
