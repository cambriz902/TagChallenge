class Api::V1::StatsController < ApplicationController

  def index
    render json: tags, status: 200
  rescue => e
    render json: { errors: e }, status: 500
  end

  private 

  def tags
    sql = "
      SELECT 
        name, 
        count(*) as count 
      FROM 
        tags 
      GROUP BY 
        name"
    ActiveRecord::Base.connection.execute(sql).entries
  end
end
