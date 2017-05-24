require "spec_helper"

describe Lita::Handlers::Dargon, lita_handler: true do
  subject { described_class.new(robot) }

  let(:dargon) do
    path = File.join(
     File.dirname(__FILE__), '..', '..', '..', 'dargon.txt'
    )

    File.read path
  end

  describe '#dargon' do
    it 'replies with a dargon' do
      send_message 'dargon'
      expect(replies.last).to eq dargon
    end
  end
end
