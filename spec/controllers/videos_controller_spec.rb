require 'spec_helper'

describe VideosController do
  describe 'POST search' do

    it 'sets @sample' do
      v1 = Video.create( title: 21251, start_time: '2014-04-24 22:03:00', start_point: 'A', end_time: '2014-04-24 22:10:00', end_point: 'BC')
      post :search, search_term: '21251'
      expect(assigns(:sample)).to eq(v1)
    end


    it 'tests the while-loop for infinite-loop issue' do

    end
    #
    # it "@sample adds to samplers-array if it's not nil" do
    #   samplers = []
    #   sampler = Video.create( title: 21251, start_time: '2014-04-24 22:03:00', start_point: 'A', end_time: '2014-04-24 22:10:00', end_point: 'BC')
    #   samplers = [sampler]
    #   post :search, search_term: '21251'
    #   expect(assigns(:samplers)).to match_array(samplers)
    # end

    # it 'set flash-error if there is an empty string' do
    #
    #   post :search, search_term: ' '
    #   expect(flash[:error]).to be_present
    #
    # end
    #
    # it 'shows flash-error if there is no match' do
    #   v1 = Video.create( title: 21251, start_time: '2014-04-24 22:03:00', start_point: 'A', end_time: '2014-04-24 22:10:00', end_point: 'BC')
    #
    #   post :search, search_term: '22121'
    #   expect(flash[:error]).to be_present
    # end
    it 'returns shows flash-error if there are not samplers to match with'
    it 'rescue the search if there are no more items to add to samplers-array'


  end

end