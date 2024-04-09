class Api::V1::CommentsController < ApplicationController
  def create

    data = {
      feature_id: params[:feature_id],
      body: params[:body]
    }

    begin
      @new_coment = Comment.create!(data)
    rescue ActiveRecord::RecordInvalid => e
      puts "Error: #{e}"
    rescue ActiveRecord::RecordNotSaved => e
      puts "Error de Conexión: #{e}"
    ensure
      puts "Fin"
    end


  end
end
