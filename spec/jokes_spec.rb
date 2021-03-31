require_relative '../lib/jokes.rb'

describe Joke do
  describe '#make_the_request' do
    let(:request) { Joke.new }
    let(:request_json) { request.make_the_request }
    it 'should return hash response when the request is sucessful' do
      expect(request_json.class).to eql(Array)
    end
    it 'returns an array response should not be empty' do
      expect(request_json.length).not_to eql(0)
    end
  end
end
