class RecommendationsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_org
  # GET /recommendations
  # GET /recommendations.json
  def index
    unless @org
      redirect_to new_account_path, :notice => I18n.t("please_add_location") and return
    end
    @recommendations = Recommendation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recommendations }
    end
  end

  # GET /recommendations/1
  # GET /recommendations/1.json
  def show
    @recommendation = Recommendation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recommendation }
    end
  end


end
