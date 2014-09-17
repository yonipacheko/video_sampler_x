require 'spec_helper'
require 'date'
require 'nokogiri'
require 'open-uri'

describe DownloadingData do
   let(:bag) { DownloadingData.new }

  describe 'initialized' do
    it 'is initialized with a Date object' do
      expect(bag.today).to eq(Date.today)
    end
  end

  describe 'interval_data' do
    it 'responds to interval_data' do
      expect(bag).to respond_to(:interval_data)
    end
    it 'takes 2 parameters to set up the time-interval' do
      bag.should_receive(:interval_data).with(kind_of(int), kind_of(int))

    end
    context 'success' do
      it ' checks if the function is calling the API for every day given in the range'
      it 'tries more than one time if the respond is been delayed?'
    end

    context 'failing' do

      it 'returns false if we dont get contact with the API'

    end


  end


  describe 'updating local DB with possible new data from the API' do

  end

  describe 'checking updated data' do
    context 'DB needs to be updated' do

    end

    context 'DB remains the same, no new data has been changed' do

    end


  end




end
