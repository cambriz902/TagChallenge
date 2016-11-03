class Api::V1::TagsController < ApplicationController
  respond_to :json

  def create
    if params[:taggable_type].constantize.exists?(params[:taggable_id])
      taggable = params[:taggable_type].constantize.find(params[:taggable_id])
      taggable.tags.destroy_all
    else
      taggable = params[:taggable_type].constantize.create()
    end
    params[:tags].each do |tag|
      Tag.create(name: tag, taggable: taggable)
    end

    render json: taggable.reload, status: 201
  rescue => e
    render json: { errors: e }, status: 422
  end

  def show
    taggable = params[:taggable_type].constantize.find(params[:taggable_id])
    render json: taggable, status: 200
  rescue => e
    render json: { errors: e }, status: 400
  end

  def destroy
    taggable = params[:taggable_type].constantize.find(params[:taggable_id])
    taggable.destroy!
    head 204
  end
end
