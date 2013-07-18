class Glass::NotificationsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def callback
    Glass::SubscriptionNotification.create(params)
    render json: {success: true}
  end

  def glass_params
    params.require(:glass_timeline_item).
      permit(:display_time, :glass_content, :glass_content_type,
             :glass_created_at, :glass_eta, :glass_item_id,
             :glass_kind, :glass_self_link, :glass_updated_at,
             :is_deleted, :google_account_id)
  end
end
