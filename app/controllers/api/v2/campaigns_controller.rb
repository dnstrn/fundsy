class Api::V2::CampaignsController < Api::V1::CampaignsController

  def index
    @campaigns = Campaign.order(:created_at)
    render json: @campaigns
    end
  end

end
