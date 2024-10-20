class ErrorsController < ApplicationController
  def not_found
    respond_to do |f|
      f.html { render 'errors/not_found', status: :not_found }
      f.json { render json: { error: 'Page not found' }, status: :not_found }
    end
  end
end
