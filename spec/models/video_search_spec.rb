require 'spec_helper'

describe VideoSearch do

  describe 'initialized' do
    it 'can be initialized with a custom-param' do
      v1 = Video.create( title: 2345 )
      vs = VideoSearch.new(v1.title)
      expect(vs.title).to eq(2345)
    end
  end


  describe 'find by title' do
      it ' it returns nil is there not match ' do
        v1 = Video.create( title: 2345 )
        expect(VideoSearch.find_by_title(1234)).to eq(nil)
      end
      it ' returns the right instance object for an exact match ' do
        v1 = Video.create( title: 2345 )
        expect(Video.find_by_title(v1.title)).to eq(v1)
      end

      #some toughts:
      # Im wondering if I should get nil if the user doesnt add content?
      # Right now I'm getting an empty array  which is not a falsy answer
      #it has to do with spec line: 65, righ there Im doing a check


      it ' returns an empty array for a search with an empty string' do
        expect(VideoSearch.find_by_title('')).to eq([])
      end
  end


  describe 'find the next video-sampler' do

    it ' returns nil if there is not match in the video table' do

      v1 = Video.create( title: 21251, start_time: '2014-04-24 22:03:00', start_point: 'A', end_time: '2014-04-24 22:10:00', end_point: 'BC')
      v2 = Video.create( title: 25012, start_time: '2014-04-24 22:20:00', start_point: 'RI', end_time: '2014-04-24 23:10:00', end_point: 'XX')
      v3 = Video.create( title: 23232, start_time: '2014-04-24 17:10:00', start_point: 'X', end_time: '2014-04-24 20:10:00', end_point: 'B')
      v4 = Video.create( title: 22435, start_time: '2014-04-24 17:10:00', start_point: 'Z', end_time: '2014-04-24 20:10:00', end_point: 'W')

      expect(VideoSearch.find_next_sampler(v4.end_time, v4.end_point)).to eq(nil)
    end

    it ' returns the next video-sampler if there is an exact match, following the given query-conditions' do

      v1 = Video.create( title: 21251, start_time: '2014-04-24 22:03:00', start_point: 'A', end_time: '2014-04-24 22:10:00', end_point: 'BC')
      v2 = Video.create( title: 25012, start_time: '2014-04-24 22:20:00', start_point: 'RI', end_time: '2014-04-24 23:10:00', end_point: 'XX')
      v3 = Video.create( title: 23232, start_time: '2014-04-24 17:10:00', start_point: 'X', end_time: '2014-04-24 20:10:00', end_point: 'B')
      v4 = Video.create( title: 22435, start_time: '2014-04-24 17:10:00', start_point: 'Z', end_time: '2014-04-24 20:10:00', end_point: 'W')
      v5 = Video.create( title: 24545, start_time: '2014-04-24 22:15:00', start_point: 'BC', end_time: '2014-04-24 22:20:00', end_point: 'RI' )
      v6 = Video.create( title: 23545, start_time: '2014-04-24 23:15:00', start_point: 'XX', end_time: '2014-04-25 00:10:00', end_point: 'E' )

      expect(VideoSearch.find_next_sampler(v5.end_time, v5.end_point)).to eq(v2)
    end
  end

  # my last question has to do with this
  #right if the user doesnt type anyting I get an empty array
  #an empty array is wont be false for the contition
  #Im wondering if it's wrong to get back an empty array instead of nil
  describe ' find then whole collection of samplers ' do

  end


end