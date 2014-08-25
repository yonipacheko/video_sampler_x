require 'spec_helper'
require 'timeout'


describe VideoSearch do

  describe 'initialized' do
    it 'can be initialized with a custom-param' do
      v1 = Video.create( title: 2345 )
      vs = VideoSearch.new(v1.title)
      expect(vs.title).to eq(2345)
    end
  end


  describe 'find all by title' do
    let(:v1) { Video.create( title: 2345 ) }

    let(:vs) { VideoSearch.new v1.title }

    it ' it returns false is there not match ' do
        expect(vs.find_all_by_title(-1)).to eq(false)
    end
    it ' returns the right instance object for an exact match ' do
      expect(vs.find_all_by_title(v1.title)).to eq(v1)
    end
    it ' returns an empty array for a search with an empty string' do
      expect{ vs.find_all_by_title('') }.to raise_error
    end
  end


  describe 'find the next sampler' do

    let(:v1) { v1 =  Video.create( title: 21251) }
    let(:vs) { VideoSearch.new v1.title }

    it 'responds to find_next_sampler' do
      expect(vs).to respond_to(:find_next_sampler)
    end

    it ' returns false if there is not match in the video table' do

      v1 = Video.create( title: 21251, start_time: '2014-04-24 22:03:00', start_point: 'A', end_time: '2014-04-24 22:10:00', end_point: 'BC')
      v2 = Video.create( title: 25012, start_time: '2014-04-24 22:20:00', start_point: 'RI', end_time: '2014-04-24 23:10:00', end_point: 'XX')
      v3 = Video.create( title: 23232, start_time: '2014-04-24 17:10:00', start_point: 'X', end_time: '2014-04-24 20:10:00', end_point: 'B')
      v4 = Video.create( title: 22435, start_time: '2014-04-24 17:10:00', start_point: 'Z', end_time: '2014-04-24 20:10:00', end_point: 'W')

      expect(vs.find_next_sampler(v4.end_time, v4.end_point)).to eq(false)
    end

    it ' returns the next video-sampler if there is an exact match, following the given query-conditions' do

      v1 = Video.create( title: 21251, start_time: '2014-04-24 22:03:00', start_point: 'A', end_time: '2014-04-24 22:10:00', end_point: 'BC')
      v2 = Video.create( title: 25012, start_time: '2014-04-24 22:20:00', start_point: 'RI', end_time: '2014-04-24 23:10:00', end_point: 'XX')
      v3 = Video.create( title: 23232, start_time: '2014-04-24 17:10:00', start_point: 'X', end_time: '2014-04-24 20:10:00', end_point: 'B')
      v4 = Video.create( title: 22435, start_time: '2014-04-24 17:10:00', start_point: 'Z', end_time: '2014-04-24 20:10:00', end_point: 'W')
      v5 = Video.create( title: 24545, start_time: '2014-04-24 22:15:00', start_point: 'BC', end_time: '2014-04-24 22:20:00', end_point: 'RI' )
      v6 = Video.create( title: 23545, start_time: '2014-04-24 23:15:00', start_point: 'XX', end_time: '2014-04-25 00:10:00', end_point: 'E' )

      expect(vs.find_next_sampler(v5.end_time, v5.end_point)).to eq(v2)
    end
  end

  describe 'find then whole collection of samplers ' do

    let(:v1) { v1 = Video.create( title: 21251 ) }
    let(:vs) { VideoSearch.new v1.title }
    let(:sample) { vs.find_all_by_title(v1.title) }
    let(:videos_count) { Video.count }


    it 'responds to find_the_whole_collection message' do
      expect(vs).to respond_to(:find_the_whole_collection)
    end

    context 'success' do
      # before :each do
      #   vs.stub(:find_all_by_title).and_return(2345)
      # end

      it 'returns a value from find_all_byt_title method' do
        expect(sample).to eq(2345)
      end

      it 'has a list of samplers' do
        vs.samplers.should be_kind_of Array
      end

      it 'has a list with an item in it' do
        vs.samplers = [stub]
        expect(vs.samplers.count).to eq(1)
      end

      it 'is the while-loop really working' do

        v1 = Video.create( title: 21251, start_time: '2014-04-24 22:03:00', start_point: 'A', end_time: '2014-04-24 22:10:00', end_point: 'BC')
        v2 = Video.create( title: 25012, start_time: '2014-04-24 22:20:00', start_point: 'RI', end_time: '2014-04-24 23:10:00', end_point: 'XX')
        v3 = Video.create( title: 23232, start_time: '2014-04-24 17:10:00', start_point: 'X', end_time: '2014-04-24 20:10:00', end_point: 'B')
        v4 = Video.create( title: 22435, start_time: '2014-04-24 17:10:00', start_point: 'Z', end_time: '2014-04-24 20:10:00', end_point: 'W')
        v5 = Video.create( title: 24545, start_time: '2014-04-24 22:15:00', start_point: 'BC', end_time: '2014-04-24 22:20:00', end_point: 'RI' )
        v6 = Video.create( title: 23545, start_time: '2014-04-24 23:15:00', start_point: 'XX', end_time: '2014-04-25 00:10:00', end_point: 'E' )

        vs_1 = VideoSearch.new v1.title
        vs_1.find_the_whole_collection(v1.title)
        Timeout.timeout(20) do
          #expect(vs_1.samplers.count).to eq(4)
          expect(vs_1).to receive(:find_the_whole_collection).with(v1.title).at_most(Video.count).times
        end
      end
    end

    context 'failing' do
      it ' complains if there is not any RIGHT match ' do
        expect{ vs.find_the_whole_collection(-1) }.to raise_error
      end
    end

  end


end