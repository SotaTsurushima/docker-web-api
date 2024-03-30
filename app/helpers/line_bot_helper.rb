module LineBotHelper
  def raku_search(received_text)
    # t['mediumImageUrls'](存在すれば)
    # 20件取得する
    rakuten = RakutenWebService::Ichiba::Item.search(keyword: received_text)
    rakuten_items = []
    
    for t in rakuten
      rakuten_items.push(
        t['mediumImageUrls'],
        t['itemName'],
        t['itemPrice'],
        t['reviewAverage']
      )
    end

    return rakuten_items
  end
end
