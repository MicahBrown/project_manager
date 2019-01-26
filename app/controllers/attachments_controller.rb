class AttachmentsController < ApplicationController
  def create
    @attachment = current_crew.attachments.build(attachment_params.merge(creator: current_user))
    @attachment.save!

    redirect_to crew_feed_index_path(current_crew), notice: "uploaded file!"
  end

  private

    def attachment_params
      params.require(:attachment).permit(:file)
    end
end
