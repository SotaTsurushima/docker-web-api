module Goods::Raku extend self
  def batch
    search()
  end

  private

  def search()
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
end