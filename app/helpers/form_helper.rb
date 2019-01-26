module FormHelper
  def form_errors(object)
    errors =
      case object
      when ActiveRecord::Base then object.errors.full_messages
      when Array              then object
      else
        nil
      end

    return unless errors.present?


    render "shared/form_errors", errors: errors
  end
end