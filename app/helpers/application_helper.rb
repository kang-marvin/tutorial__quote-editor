module ApplicationHelper
  def submit_button_label(obj)
    submit_type = obj.id ? "Update" : "Create"
    "#{submit_type} #{model_class_name(obj)}"
  end

  private

  def model_class_name(obj)
    obj.class.name.downcase
  end
end
