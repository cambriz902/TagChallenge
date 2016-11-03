class Api::V1::StatsController < ApplicationController

  def index
    sql = "
      SELECT 
        name, 
        count(*) as count 
      FROM 
        tags 
      GROUP BY 
        name"
    tags = ActiveRecord::Base.connection.execute(sql).entries
    render json: tags, status: 200
  rescue => e
    render json: { errors: e }, status: 500
  end

  def show
    sql = "
      SELECT 
        name, 
        count(*) as count
      FROM 
        tags 
      JOIN
        #{params[:taggable_type]}s on #{params[:taggable_type]}s.id = tags.taggable_id
      WHERE
        articles.id = #{params[:taggable_id]}
      GROUP BY 
        name"
    tags = ActiveRecord::Base.connection.execute(sql).entries
    render json: tags, status: 200
  rescue => e
    render json: { errors: e }, status: 500
  end

end
