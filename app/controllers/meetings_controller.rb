class MeetingsController < ApplicationController
  before_action :check_tutee_logged_in, :except => [:index]
  layout 'tutee_layout'

  def meeting_params
    params.permit(:tutee, :tutor_id, :evaluation_id, :dates, :request_id, :tutee_id)
  end

  def index
  end

  def show
    @tutee = Tutee.find_by_id(params[:tutee_id])
    @meeting = Meeting.where(tutee_id: params[:tutee_id]).first
    if @meeting.nil?
        @dates = [
        Time.now.strftime("%a %d %H:00")
        ]
    else
        @dates = [
                    Time.now.strftime("%a %d %H:00"),
                    (Time.now + 10799).strftime("%a %d %H:00"),
                    (Time.now + 80599).strftime("%a %d %H:00"),
                    ]
    end
    
  end

  def new
   @tutee = Tutee.find_by_id(params[:tutee_id])
   #@dates = [Time.now]
  end

  def edit
  end

  def create
    # Checks if parameters are good
    @meeting = Meeting.where(tutee_id: params[:tutee_id]).first
  end

  def update
  end
  def destroy
  end
end
