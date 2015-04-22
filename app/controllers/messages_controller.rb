class MessagesController < ApplicationController
  before_action :authenticate_user!

  def new
    @message = Message.new
    @sitter = User.find(params[:sitter_id])
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.sitter = User.find(params[:sitter_id])

    if @message.save
      ActionMailer::Base.mail(
        from: @message.user.email,
        to: @message.sitter.email,
        subject: @message.subject,
        body: @message.message
        ).deliver
      flash[:notice] = "Message sent."
      redirect_to sitter_path(@message.sitter)
    else
      flash[:note] = "Message could not send."
      redirect_to sitter_path(@message.sitter)
    end
  end

  private

  def message_params
    params.require(:message).permit(:subject, :message)
  end
end
