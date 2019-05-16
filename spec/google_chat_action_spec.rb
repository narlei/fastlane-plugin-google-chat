describe Fastlane::Actions::GoogleChatAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The google_chat plugin is working!")

      Fastlane::Actions::GoogleChatAction.run(nil)
    end
  end
end
