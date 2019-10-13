module ProjectHelper
  def form_action
    if @project.id.present?
      "Update"
    else
      "Create"
    end
  end
end