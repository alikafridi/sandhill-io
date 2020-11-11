class UploadDomainJob < ApplicationJob
	include ApplicationHelper
  queue_as :default

  def perform(file)
  	
  end
end