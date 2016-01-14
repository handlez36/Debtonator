class PayplansController < ApplicationController
  before_action :authenticate_user! 
  before_action :authorize_user, :only => [:destroy, :lock]
  
  # Controller action for archived expense/payments requests
  def archived
    
  end
  
  # Controller action for destorying a payplan
  def destroy
    @payplan.destroy
    redirect_to expenses_path
  end
  
  # Controller action for locking/archiving in a payplan
  def lock
    lock_status = @payplan.lock
    
    flash[:alert] = "Error locking payplan: #{lock_status.errors}" unless lock_status
    redirect_to expenses_path
  end
  
  private
  
  # Return the current payplan for this specific request
  helper_method :current_payplan
  def current_payplan
    @payplan ||= Payplan.find_by_id(params[:id])
  end
  
  # Return current archived payment plans for the current user
  helper_method :current_plans
  def current_plans
    @payplans ||= current_user.payplans.where(:archived => true)
  end
  
  # Ensure certain payplan interactions are being performed by the user that created them
  def authorize_user
    if current_user != current_payplan.user
      flash[:alert] = "Unauthorized User!"
      render :text => "Unauthorized action", :status => :unprocessable_entity
    end
  end
  
end
