module ApplicationHelper
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

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
          link_to("Create a Gig", new_venue_gig_path(@venue), html_options: {class: "btn btn-success", role: "button"})
        end
      end
    else
      dingus = ''

      if disp == :short
        gigs.each do |gig|
          dingus += render("shared/gig_sm", venue: gig.venue, gig: gig)
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
