module ApplicationHelper
  def fulltime(created_at)
    created_at.to_s(:date)+" "+created_at.to_s(:time).gsub(/^0/,'').downcase
  end

  def display_gigs(gigs, disp)
    if gigs.empty?
      if disp == :short
        content_tag(:h3, "No Upcoming Gigs")
      else
        content_tag(:div, class: "panel-body") do
          content_tag(:h3, "Looks like you have no gigs!") + \
          link_to("Create a Timeslot", new_venue_timeslot_path(@venue), html_options = {class: "btn btn-success", role: "button"})
        end
      end
    else
      dingus = ''

      if disp == :short
        gigs.each do |gig|
          dingus += render("shared/gig_sm", gig: gig)
        end
      else
        gigs.each do |gig|
          dingus += render("shared/gig_full", gig: gig)
        end
      end

      dingus.html_safe
    end
  end
end
