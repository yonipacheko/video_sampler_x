require 'spec_helper'

describe Video do
  describe  'search_by_number ' do
    it 'returns an empty array if there is not match' do
      t1 = Video.create(title: 2345)
      t2 = Video.create(title: 2323)
      expect(Video.search_by_number('2346')).to eq([])
    end

    it 'returns an array of one video  for an exact match' do
      t1 = Video.create(title: 2345)
      t2 = Video.create(title: 2323)
      expect(Video.search_by_number(2345)).to eq([t1])
    end

    it 'returns an empty array for a search with a empty string' do
      t1 = Video.create( title: 2345 )
      t2 = Video.create( title: 2323 )
      expect(Video.search_by_number('')).to eq([])
    end
  end

  describe 'find by tittle' do
    it ' it returns nil is there not match ' do
      t1 = Video.create( title: 2345 )
      t2 = Video.create( title: 2323 )
      expect(Video.find_by_title(3434)).to eq(nil)
    end
    it ' returns the right instance object for an exact match ' do
      t1 = Video.create( title: 2345 )
      t2 = Video.create( title: 2323 )
      expect(Video.find_by_title(2345)).to eq(t1)
    end
    it ' returns an empty array for a search with an empty string' do
      expect(Video.find_by_title('')).to eq([])
    end
  end

  describe 'find the next sampler' do

    it ' returns nil if there is not match in the video table' do

      v1 = Video.create( title: 21251, start_time: '2014-04-24 22:03:00', start_point: 'A', end_time: '2014-04-24 22:10:00', end_point: 'BC')
      v2 = Video.create( title: 25012, start_time: '2014-04-24 22:20:00', start_point: 'RI', end_time: '2014-04-24 23:10:00', end_point: 'XX')
      v3 = Video.create( title: 23232, start_time: '2014-04-24 17:10:00', start_point: 'X', end_time: '2014-04-24 20:10:00', end_point: 'B')
      v4 = Video.create( title: 22435, start_time: '2014-04-24 17:10:00', start_point: 'Z', end_time: '2014-04-24 20:10:00', end_point: 'W')


      expect(Video.find_next_sampler(v4.end_time, v4.end_point)).to eq(nil)

    end

    it ' returns the next video-sampler if there is an exact match, following the given query-conditions' do

      v1 = Video.create( title: 21251, start_time: '2014-04-24 22:03:00', start_point: 'A', end_time: '2014-04-24 22:10:00', end_point: 'BC')
      v2 = Video.create( title: 25012, start_time: '2014-04-24 22:20:00', start_point: 'RI', end_time: '2014-04-24 23:10:00', end_point: 'XX')
      v3 = Video.create( title: 23232, start_time: '2014-04-24 17:10:00', start_point: 'X', end_time: '2014-04-24 20:10:00', end_point: 'B')
      v4 = Video.create( title: 22435, start_time: '2014-04-24 17:10:00', start_point: 'Z', end_time: '2014-04-24 20:10:00', end_point: 'W')
      v5 = Video.create( title: 24545, start_time: '2014-04-24 22:15:00', start_point: 'BC', end_time: '2014-04-24 22:20:00', end_point: 'RI' )
      v6 = Video.create( title: 23545, start_time: '2014-04-24 23:15:00', start_point: 'XX', end_time: '2014-04-25 00:10:00', end_point: 'E' )

      expect(Video.find_next_sampler(v5.end_time, v5.end_point)).to eq(v2)
    end
  end

end