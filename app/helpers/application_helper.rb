module ApplicationHelper
  def tab_classes(test_path)
    classes = ["nav-link"]
    classes << "active" if request.path == test_path
    classes.join(" ")
  end
end
