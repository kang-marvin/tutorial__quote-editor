module ApplicationHelper
  def submit_button_label(obj)
    return nil if obj.nil?
    return nil unless is_an_instance_of_active_model?(obj)

    submit_type = obj.id ? "Update" : "Create"
    "#{submit_type} #{model_class_name(obj)}"
  end

  private

  def model_class_name(obj)
    obj.class.name.downcase
  end

  def is_an_instance_of_active_model?(obj)
    obj.is_a?(ActiveRecord::Base)
  end
end
