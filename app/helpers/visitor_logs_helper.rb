module VisitorLogsHelper
  def signed_in?
    if logged_in?
      current_user.visitor_logs.last.time_out.nil?
    end
  end
  def current_log
    if logged_in?
      current_user.visitor_logs.last
    end
  end
end
