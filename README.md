# google_chat plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-google_chat)


![](https://narlei.com/fastlane-plugin-google.jpg)
## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-google_chat`, add it to your project by running:

```bash
fastlane add_plugin google_chat
```

## About google_chat

Send messages to Google Chat

**Note to author:** Add a more detailed description about this plugin here. If your plugin contains multiple actions, make sure to mention them here.

## Example

Check out the [example `Fastfile`](fastlane/Fastfile) to see how to use this plugin. Try it by cloning the repo, running `fastlane install_plugins` and `bundle exec fastlane test`.

````ruby 
google_chat(
      imageUrl: 'URL_OF_ICON',
      webhook: 'URL_OF_WEBHOOK',
      title: 'TITLE',
      description: 'MESSAGE',
      section1Title: 'TITLE_SESSION',
      section1Description: 'DESCRIPTION_SESSION',
      buttonTitle: "BUTTON_TITLE",
      buttonUrl: "URL_ACTION"
    )
````



## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
