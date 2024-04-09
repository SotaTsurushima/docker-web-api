module LineBotHelper
  def raku_search(received_text)
    rakuten_response = RakutenWebService::Ichiba::Item.search(keyword: received_text)
    rakuten_items = []
    
    rakuten_response.each do |r|
      if r['reviewAverage'] > 4.5 && rakuten_items.count < 5
        rakuten_items.push(
          {
            mediumImageUrls: r['mediumImageUrls'],
            itemName: filter_itemName(received_text, r),
            itemPrice: r['itemPrice'],
            reviewAverage: r['reviewAverage'],
            itemUrl: r['itemUrl']
          }
        )
      end
    end

    return rakuten_items
  end

  def filter_itemName(text, rakuten_item)
    itemName = rakuten_item['itemName'].slice(0, 15)
    return itemName
  end
end
