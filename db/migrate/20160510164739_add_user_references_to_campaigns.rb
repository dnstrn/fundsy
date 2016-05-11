class AddUserReferencesToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :user, :string
    add_column :campaigns, :references, :string
  end
end
