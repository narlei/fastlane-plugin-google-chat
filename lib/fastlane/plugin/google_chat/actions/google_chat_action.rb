  require 'fastlane/action'
  require_relative '../helper/google_chat_helper'
  require 'net/http'
  require 'uri'
  require 'json'

  module Fastlane
    module Actions
      class GoogleChatAction < Action
        def self.run(params)

          uri = URI.parse(options[:webhook])

          header = {'Content-Type': 'application/json'}
          cards = [
              {
                  header: {
                      title: options[:title],
                      subtitle: options[:description],
                      imageUrl: 'https://collegeinfogeek.com/wp-content/uploads/2016/08/Google_Calendar_Logo.png'
                  },
                  sections: [
                      {
                          widgets: [
                              {
                                  keyValue: {
                                      topLabel: options[:section1Title],
                                      content: options[:section1Description]
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
                                              text: options[:buttonTitle],
                                              onClick: {
                                                  openLink: {
                                                      url: options[:buttonUrl]
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
          ]
          # Create the HTTP objects
          http = Net::HTTP.new(uri.host, uri.port)
          request = Net::HTTP::Post.new(uri.request_uri, header)
          request.body = card.to_json
          
          # Send the request
          response = http.request(request)

          UI.message("The google_chat plugin is working!")
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
            # FastlaneCore::ConfigItem.new(key: :your_option,
            #                         env_name: "GOOGLE_CHAT_YOUR_OPTION",
            #                      description: "A description of your option",
            #                         optional: false,
            #                             type: String)
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
