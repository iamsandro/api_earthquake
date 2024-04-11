class Api::V1::CommentsController < ApplicationController

  def create

   render json: {error: 'feature_id is mandatory'}, status: :bad_request unless params[:feature_id]&.present?
   render json: {error: 'The comment is empty, body is mandatory'}, status: :bad_request unless params[:body]&.present?
     
    data = {
      feature_id: params[:feature_id],
      body: params[:body]
    }

    begin
      @new_coment = Comment.create!(data)
      render json: @new_coment, status: 200

    rescue ActiveRecord::RecordInvalid => e
      render json: { error: e }, status: 404

    rescue ActiveRecord::RecordNotSaved => e
      render json: { error: e}, status: 503

    end

  end
  
end
