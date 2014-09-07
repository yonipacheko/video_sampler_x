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

  describe 'video_search' do

    describe 'initialized VideoSearch class' do
      context 'success' do

        it 'initializes VideoSearch-class' do
          # Passes if actual contains all of the expected regardless of order.
          # This works for collections. Pass in multiple args  and it will only
          # pass if all args are found in collection.
          v1 = Video.create( title: 21251, start_time: '2014-04-24 22:03:00', start_point: 'A', end_time: '2014-04-24 22:10:00', end_point: 'BC')
          v2 = Video.create( title: 25012, start_time: '2014-04-24 22:20:00', start_point: 'RI', end_time: '2014-04-24 23:10:00', end_point: 'XX')
          v3 = Video.create( title: 23232, start_time: '2014-04-24 17:10:00', start_point: 'X', end_time: '2014-04-24 20:10:00', end_point: 'B')
          v4 = Video.create( title: 22435, start_time: '2014-04-24 17:10:00', start_point: 'Z', end_time: '2014-04-24 20:10:00', end_point: 'W')
          v5 = Video.create( title: 24545, start_time: '2014-04-24 22:15:00', start_point: 'BC', end_time: '2014-04-24 22:20:00', end_point: 'RI' )
          v6 = Video.create( title: 23545, start_time: '2014-04-24 23:15:00', start_point: 'XX', end_time: '2014-04-25 00:10:00', end_point: 'E' )

          expect(Video.video_search(21251)).to  eq( [v1, v5, v2, v6] )
        end
      end

      context 'with invalid data' do
        it 'sets false if there is not right match' do
          v1 = Video.create( title: 21251, start_time: '2014-04-24 22:03:00', start_point: 'A', end_time: '2014-04-24 22:10:00', end_point: 'BC')
          expect(Video.video_search('234')).to eq(false)
        end

        it 'sets false if there is not right match' do
          expect(Video.video_search(-1)).to eq(false)
        end
      end
    end
  end



end