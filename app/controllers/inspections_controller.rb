class InspectionsController < ApplicationController
  def index
    render json: Inspection.all
  end

  def show
    render json: Inspection.where(inspection_id: params[:id]).first
  end
end
