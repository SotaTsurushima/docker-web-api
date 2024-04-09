module LineBotHelper
  def raku_search(received_text)
    # t['mediumImageUrls'](存在すれば)
    # 20件取得する
    rakuten_response = RakutenWebService::Ichiba::Item.search(keyword: received_text)
    rakuten_items = []
    
    rakuten_response.each do |t|
      if t['reviewAverage'] > 4.5 && rakuten_items.count < 5
        rakuten_items.push(
          {
            mediumImageUrls: t['mediumImageUrls'],
            itemName: t['itemName'],
            itemPrice: t['itemPrice'],
            reviewAverage: t['reviewAverage']
          }
        )
      end
    end

    return rakuten_items
  end
end
