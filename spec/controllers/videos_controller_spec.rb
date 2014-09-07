require 'spec_helper'

describe VideosController do
  describe 'POST search' do
    context 'success' do
      it ' sets @results' do
        v1 = Video.create( title: 21251, start_time: '2014-04-24 22:03:00', start_point: 'A', end_time: '2014-04-24 22:10:00', end_point: 'BC')
        v2 = Video.create( title: 25012, start_time: '2014-04-24 22:20:00', start_point: 'RI', end_time: '2014-04-24 23:10:00', end_point: 'XX')
        v3 = Video.create( title: 23232, start_time: '2014-04-24 17:10:00', start_point: 'X', end_time: '2014-04-24 20:10:00', end_point: 'B')
        v4 = Video.create( title: 22435, start_time: '2014-04-24 17:10:00', start_point: 'Z', end_time: '2014-04-24 20:10:00', end_point: 'W')
        v5 = Video.create( title: 24545, start_time: '2014-04-24 22:15:00', start_point: 'BC', end_time: '2014-04-24 22:20:00', end_point: 'RI' )
        v6 = Video.create( title: 23545, start_time: '2014-04-24 23:15:00', start_point: 'XX', end_time: '2014-04-25 00:10:00', end_point: 'E' )

        post :search, search_term: '21251'
        expect(assigns(:results)).to eq([v1, v5, v2, v6])
      end

      it 'sets notice not to be blank' do
        v1 = Video.create( title: 21251, start_time: '2014-04-24 22:03:00', start_point: 'A', end_time: '2014-04-24 22:10:00', end_point: 'BC')

        post :search, search_term: '21251'
        expect(flash[:notice]).not_to be_blank
      end

      it 'redirects to the search page' do
        v1 = Video.create( title: 21251, start_time: '2014-04-24 22:03:00', start_point: 'A', end_time: '2014-04-24 22:10:00', end_point: 'BC')

        post :search, search_term: '21251'
        expect(response).to redirect_to search_path

      end
    end

    context 'with invalid data' do

      it ' sets the error message if the search_term is blanked ' do

        post :search, search_term: ' '
        expect(flash[:error]).not_to be_blank

      end

      it ' sets the error message of the sarch_term has wrong value ' do

        post :search, search_term: -1
        expect(flash[:error]).not_to be_blank

      end
    end
  end
end