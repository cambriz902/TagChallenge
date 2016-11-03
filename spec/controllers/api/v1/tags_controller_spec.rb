require 'spec_helper'

describe Api::V1::TagsController do
  describe 'POST #create' do 
    context 'when is successfully create' do
      it "creates entity and the correct number of tags when entity doesn't exist" do
        tag_attributes = { 
          taggable_id: 1, 
          taggable_type: 'Product',
          tags: ['Large', 'Pink', 'Bike'] 
        }
        post :create, tag_attributes
        expect(json_response[:product][:tags]).to have(3).items
      end

      it "replaces the tags of an existing entity" do
        product = FactoryGirl.create(:product)
        2.times { FactoryGirl.create(:tag, taggable: product) }
        tag_attributes = { 
          taggable_id: product.id, 
          taggable_type: product.class.name,
          tags: ['Large', 'Pink', 'Bike'] 
        }
        post :create, tag_attributes
        expect(json_response[:product][:tags]).to have(3).items
      end

      it 'responds with code 201' do
        tag_attributes = { 
          taggable_id: 1, 
          taggable_type: 'Product',
          tags: ['Large', 'Pink', 'Bike'] 
        }
        post :create, tag_attributes
        expect(response.status).to eql(201)
      end

    end

    context 'when is not created successfully' do 
      before(:each) do
        tag_attributes = { 
          taggable_id: 1, 
          taggable_type: 'random',
          tags: ['Large', 'Pink', 'Bike'] 
        }
        post :create, tag_attributes
      end
      it 'renders json errors' do
        expect(json_response[:errors]).to eql('wrong constant name random')
      end

      it { should respond_with 422 }

    end
  end

  describe 'GET #show' do 
    context 'when request is successful' do
      before(:each) do 
        product = FactoryGirl.create(:product)
        2.times { FactoryGirl.create(:tag, taggable: product) }
        params = {
          taggable_id: product.id,
          taggable_type: product.class.name
        }
        get :show, params
      end

      it 'retreaves the taggable object' do 
        expect(json_response[:product]).to_not eql(nil)
      end

      it 'retreaves the tags in the response' do
        expect(json_response[:product][:tags]).to have(2).items
      end

      it { should respond_with 200 }
    end

    context 'when request is not successful' do 
      before(:each) do 
        params = {
            taggable_id: 1,
            taggable_type: 'random'
          }
        get :show, params
      end

      it 'return request error' do
        expect(json_response[:errors]).to eql'wrong constant name random'
      end

      it { should respond_with 400 }
    end
  end

  describe 'DELETE #destroy' do
    before(:each) do 
      @product = FactoryGirl.create(:product)
      @product_tag = FactoryGirl.create(:tag, taggable: @product)
      params = {
        taggable_id: @product.id,
        taggable_type: @product.class.name
      }
      delete :destroy, params
    end

    it 'destroys taggable record' do
      expect { @product.reload }.to raise_error ActiveRecord::RecordNotFound
    end 

    it 'destroys tag records' do
      expect { @product_tag.reload }.to raise_error ActiveRecord::RecordNotFound
    end

    it { should respond_with 204 }
  end
end
