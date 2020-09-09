class InterviewsController < ApplicationController
  def my_interviews
    @interviews = Interview.where(user: current_user)
    @upcoming_interviews = @interviews.select { |i| i.date >= Date.today }
  end

  def new
    @inquiry = Inquiry.find(params[:inquiry_id])
    @offer = Offer.find(params[:offer_id])
    @interview = Interview.new
  end

  def create
    @interview = Interview.new(interview_params)
    @interview.user = current_user
    @interview.inquiry = Inquiry.find(params[:inquiry_id])
    if @interview.save
      redirect_to my_interviews_path
    else
      render :new
      flash.alert = "Ops! Something went wrong."
    end
  end
  private

  def interview_params
    params.require(:interview).permit(:time, :date, :infos)
  end
end
