module VisitorLogsHelper
  def signed_in?
    if logged_in?
      @visitor_log = current_user.visitor_logs.last
      !@visitor_log.nil?&&@visitor_log.time_out.nil?
    end
  end
  def current_log
    if logged_in?
      current_user.visitor_logs.last
    end
  end
end
