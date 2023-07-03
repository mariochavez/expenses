class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def not_found
    message = "Record not found with ID #{params[:id]} in controller #{self.class}"
    Rails.logger.error message

    redirect_to page_not_found_url
  end
end
