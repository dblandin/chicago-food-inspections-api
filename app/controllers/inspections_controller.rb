class InspectionsController < ApplicationController
  def index
    if query = params[:name]
      inspections = Search.new(:aka_name, query).results
    else
      inspections = Inspection.all
    end

    render json: inspections
  end

  def show
    render json: Search.new(params[:id]).results.first
  end

  class Search
    attr_reader :column, :query

    def initialize(column = :inspection_id, query)
      @column = column
      @query = query
    end

    def results
      @_results ||= Inspection.where("lower(#{column}) like ?", "%#{query.downcase}%")
    end
  end
end
