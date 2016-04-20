class ChangeCampaignTitleFromIntegerToString < ActiveRecord::Migration
  def change
    change_column(:campaigns, :title, :string)
  end
end
