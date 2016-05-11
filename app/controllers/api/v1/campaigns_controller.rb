class Api::V1::CampaignsController < ApplicationController

  def index
    @campaigns = Campaign.order(:created_at)
    # this will render /api/v1/views/index.json.jbuilder
  end

  def show
    campaign = Campaign.find params[:id]
    render json: campaign
  end

  def create
    @campaign = Campaign.new(campaign_params)
    if @campaign.save
      render json: campaign
    else
      render json: {errors: campaign.errors.full_messages}
    end
  end

  private

  def campaign_params
    params.require(:campaign).permit(:title, :body, :goal, :end_date)
  end

end
