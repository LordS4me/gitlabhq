module NavHelper
  def page_gutter_class
    if current_path?('merge_requests#show') ||
        current_path?('merge_requests#diffs') ||
        current_path?('merge_requests#commits') ||
        current_path?('merge_requests#builds') ||
        current_path?('merge_requests#conflicts') ||
        current_path?('merge_requests#pipelines') ||
        current_path?('issues#show')
      if cookies[:collapsed_gutter] == 'true'
        "page-gutter right-sidebar-collapsed"
      else
        "page-gutter right-sidebar-expanded"
      end
    elsif current_path?('builds#show')
      "page-gutter build-sidebar right-sidebar-expanded"
    elsif current_path?('wikis#show') ||
        current_path?('wikis#edit') ||
        current_path?('wikis#update') ||
        current_path?('wikis#history') ||
        current_path?('wikis#git_access')
      "page-gutter wiki-sidebar right-sidebar-expanded"
    end
  end

  def nav_header_class
    class_name = ''
    class_name << " with-horizontal-nav" if defined?(nav) && nav

    class_name
  end

  def layout_nav_class
    "page-with-layout-nav" if defined?(nav) && nav
  end

  def nav_control_class
    "nav-control" if current_user
  end
end
