class VisitorLogsController < ApplicationController
  def new
    @visitor_log = VisitorLog.new
  end

  def create
    @visitor_log = VisitorLog.new(visitor_log_params)
    timeIn = Time.now.getlocal
    @visitor_log.time_in=timeIn
    @visitor_log.student_name=current_user.name
    @visitor_log.user_id=current_user.id
    if @visitor_log.save
      flash[:success] = "You have started logging your hours"
      redirect_to @visitor_log
    else
      render 'new'
    end
  end

  def show
    @visitor_log = VisitorLog.find(params[:id])

  end

  def sign_out
    @visitor_log =current_user.visitor_logs.last
    timeOut = Time.now.getlocal
    @visitor_log.time_out = timeOut
    @visitor_log.save
    redirect_to visitor_logs_path
  end

  def index
    @visitor_logs= current_user.visitor_logs
  end

end

private

def visitor_log_params
  params.require(:visitor_log).permit(:reason)
end

