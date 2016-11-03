require 'spec_helper'

describe Api::V1::StatsController do
  describe 'GET #index' do 
    before(:each) do 
      product = FactoryGirl.create(:product)
      article = FactoryGirl.create(:article)
      product_tags = ['sport', 'stores']
      article_tags = ['stores']
      product_tags.each do |tag| 
        FactoryGirl.create(:tag, name: tag, taggable: product) 
      end
      article_tags.each do |tag| 
        FactoryGirl.create(:tag, name: tag, taggable: article) 
      end
      get :index
    end

    it 'returns statistics with number of tags' do 
      expect(json_response[:stats]).to have(2).items
    end

    it 'returns statistics with tags names' do 
      expect(json_response[:stats][0][:name]).to eql('stores')
      expect(json_response[:stats][1][:name]).to eql('sport')
    end

    it 'returns statistics with count' do 
      expect(json_response[:stats][0][:count]).to eql(2)
      expect(json_response[:stats][1][:count]).to eql(1)
    end

    it { should respond_with 200 }
  end

  describe 'GET #show' do 
    before(:each) do
      article_one = FactoryGirl.create(:article)
      article_two = FactoryGirl.create(:article)
      article_one_tags = ['sport', 'stores']
      article_two_tags = ['stores']
      article_one_tags.each do |tag| 
        FactoryGirl.create(:tag, name: tag, taggable: article_one) 
      end
      article_two_tags.each do |tag| 
        FactoryGirl.create(:tag, name: tag, taggable: article_two) 
      end
      params = {
        taggable_type: article_two.class.name,
        taggable_id: article_two.id
      }
      get :show, params
    end

     it 'returns statistics with number of tags' do 
      expect(json_response[:stats]).to have(1).items
    end

    it 'returns statistics with tags names' do 
      expect(json_response[:stats][0][:name]).to eql('stores')
    end

    it 'returns statistics with count' do 
      expect(json_response[:stats][0][:count]).to eql(1)
    end

    it { should respond_with 200 }
  end
end
