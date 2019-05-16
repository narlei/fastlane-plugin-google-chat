  require 'fastlane/action'
  require_relative '../helper/google_chat_helper'
  require 'net/http'
  require 'uri'
  require 'json'
  
  module Fastlane
    module Actions
      class GoogleChatAction < Action
        def self.run(params)

          uri = URI.parse(params[:webhook])
          cards = {cards: [
            {
              header: {
                title: params[:title],
                subtitle: params[:description],
                imageUrl: params[:imageUrl]
              },
              sections: [
                {
                  widgets: [
                    {
                      keyValue: {
                        topLabel: params[:section1Title],
                        content: params[:section1Description]
                      }
                    }
                  ]
                },
                {
                  widgets: [
                    {
                      buttons: [
                        {
                          textButton: {
                            text: params[:buttonTitle],
                            onClick: {
                              openLink: {
                                url: params[:buttonUrl]
                              }
                            }
                          }
                        }
                      ]
                    }
                  ]
                }
              ]
            }
          ]}
          # Create the HTTP objects
          http = Net::HTTP.new(uri.host, uri.port)
          http.use_ssl = true
          http.verify_mode = OpenSSL::SSL::VERIFY_PEER
          request = Net::HTTP::Post.new(uri.request_uri)
          request.body = cards.to_json
          
          # Send the request
          response = http.request(request)

          UI.message("Message sent!")
        end
        
        def self.description
          "Send messages to Google Chat"
        end
        
        def self.authors
          ["Narlei Américo Moreira"]
        end
        
        def self.return_value
          # If your method provides a return value, you can describe here what it does
        end
        
        def self.details
          # Optional:
          "Send messages to Google Chat rooms"
        end
        
        def self.available_options
          [
            FastlaneCore::ConfigItem.new(key: :imageUrl,
                                    env_name: "GOOGLE_CHAT_imageUrl",
                                description: "A description of your option",
                                    optional: false,
                                        type: String),
            FastlaneCore::ConfigItem.new(key: :webhook,
                                    env_name: "GOOGLE_CHAT_webhook",
                                description: "A description of your option",
                                    optional: false,
                                        type: String),
            FastlaneCore::ConfigItem.new(key: :title,
                                                env_name: "GOOGLE_CHAT_title",
                                            description: "A description of your option",
                                                optional: false,
                                                    type: String),                                      
            FastlaneCore::ConfigItem.new(key: :description,
                                                env_name: "GOOGLE_CHAT_webhook",
                                            description: "A description of your option",
                                                optional: false,
                                                    type: String),                                     
            FastlaneCore::ConfigItem.new(key: :section1Title,
                                                env_name: "GOOGLE_CHAT_section1Title",
                                            description: "A description of your option",
                                                optional: false,
                                                    type: String),
            FastlaneCore::ConfigItem.new(key: :section1Description,
                                                env_name: "GOOGLE_CHAT_section1Description",
                                            description: "A description of your option",
                                                optional: false,
                                                    type: String),
            FastlaneCore::ConfigItem.new(key: :buttonTitle,
                                                env_name: "GOOGLE_CHAT_buttonTitle",
                                            description: "A description of your option",
                                                optional: false,
                                                    type: String),
            FastlaneCore::ConfigItem.new(key: :buttonUrl,
                                                env_name: "GOOGLE_CHAT_buttonUrl",
                                            description: "A description of your option",
                                                optional: false,
                                                    type: String)                                         
          ]
        end
        
        def self.is_supported?(platform)
          # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
          # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
          #
          [:ios, :mac, :android].include?(platform)
          true
        end
      end
    end
  end
  