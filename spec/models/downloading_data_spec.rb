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
    context 'success' do
      it 'takes 2 integers as parameters to set up the time-interval' do

        #stubbing but not actually testing the interval method.
        # expect(bag).to receive(:interval_data).with(kind_of(Integer), kind_of(Integer)).and_call_original
        # bag.interval_data(1, 2)
        expect(bag.interval_data(1, 2)).to eq(true)
      end

      #We need to use VCR here! to test the for loop!!
      it ' checks if the function is calling the API for every day given in the range', :vcr do
        expect(bag.interval_data(1, 2)).to eq(true)

      end

      #We need to integrate a try-catch solution
      it 'tries more than one time if the respond is been delayed?'
    end

    context 'failing' do
      it 'takes 1 or 2 no-integer values as parameters to set up the time-interval' do
        expect(bag.interval_data(1.3, 2)).to eq(false)
      end
      it 'returns false if we dont get contact with the API' do

      end

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
