class LineBotController < ApplicationController
  protect_from_forgery :except => [:callback]

  def callback
    body = request.body.read
    
    events = client.parse_events_from(body)
    events.each do |event|
      case event
      when Line::Bot::Event::Message
        case event.type
        when Line::Bot::Event::MessageType::Text
          message = {
            type: "text",
            text: event.message["text"]
          }

          carousel = [
            {
              "type": "template",
              "altText": "this is a carousel template",
              "template": {
                "type": "carousel",
                "columns": [
                  {
                    "thumbnailImageUrl": "https://example.com/bot/images/item1.jpg",
                    "imageBackgroundColor": "#FFFFFF",
                    "title": "abcd",
                    "text": "description",
                    "defaultAction": {
                      "type": "uri",
                      "label": "View detail",
                      "uri": "http://example.com/page/123"
                    },
                    "actions": [
                      {
                        "type": "uri",
                        "label": "View detail",
                        "uri": "http://example.com/page/111"
                      }
                    ]
                  },
                  {
                    "thumbnailImageUrl": "https://example.com/bot/images/item2.jpg",
                    "imageBackgroundColor": "#000000",
                    "title": "ohhh",
                    "text": "description",
                    "defaultAction": {
                      "type": "uri",
                      "label": "View detail",
                      "uri": "http://example.com/page/222"
                    },
                    "actions": [
                      {
                        "type": "uri",
                        "label": "View detail",
                        "uri": "http://example.com/page/222"
                      }
                    ]
                  },
                  {
                    "thumbnailImageUrl": "https://example.com/bot/images/item2.jpg",
                    "imageBackgroundColor": "#000000",
                    "title": "yyyy",
                    "text": "description",
                    "defaultAction": {
                      "type": "uri",
                      "label": "View detail",
                      "uri": "http://example.com/page/222"
                    },
                    "actions": [
                      {
                        "type": "uri",
                        "label": "View detail",
                        "uri": "http://example.com/page/222"
                      }
                    ]
                  },
                  {
                    "thumbnailImageUrl": "https://example.com/bot/images/item2.jpg",
                    "imageBackgroundColor": "#000000",
                    "title": "abcd",
                    "text": "description",
                    "defaultAction": {
                      "type": "uri",
                      "label": "View detail",
                      "uri": "http://example.com/page/222"
                    },
                    "actions": [
                      {
                        "type": "uri",
                        "label": "View detail",
                        "uri": "http://example.com/page/222"
                      }
                    ]
                  },
                  {
                    "thumbnailImageUrl": "https://example.com/bot/images/item2.jpg",
                    "imageBackgroundColor": "#000000",
                    "title": "abcd",
                    "text": "description",
                    "defaultAction": {
                      "type": "uri",
                      "label": "View detail",
                      "uri": "http://example.com/page/222"
                    },
                    "actions": [
                      {
                        "type": "uri",
                        "label": "View detail",
                        "uri": "http://example.com/page/222"
                      }
                    ]
                  },
                ],
                "imageAspectRatio": "rectangle",
                "imageSize": "cover"
              }
            }
          ]

          items_information = view_context.raku_search(message[:text])
          
          # mediumImageUrls: t['mediumImageUrls'],
          # itemName: t['itemName'],
          # itemPrice: t['itemPrice'],
          # reviewAverage: t['reviewAverage']
          items_information.each_with_index do |i, index|
            # puts carousel[0][:template][:columns][1][:imageUrl]
            # puts carousel[0][:template][:columns][2][:imageUrl]
            # puts carousel[0][:template][:columns][index][:action][:text]
            carousel[0][:template][:columns][index][:thumbnailImageUrl] = i[:mediumImageUrls][0]
            puts "--------------------------------"
            puts carousel[0][:template][:columns][index][:text]
            puts i[:itemName]
            carousel[0][:template][:columns][index][:text] = "aaa"
            carousel[0][:template][:columns][index][:text] = i[:itemName]
            puts "--------------------------------"
          end

          puts carousel

          # imageURL書き換えたい

          client.reply_message(event['replyToken'], carousel)
        end
      end
    end
  end

  private

  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
  end

end
