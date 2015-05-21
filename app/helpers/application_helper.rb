module ApplicationHelper
  def fulltime(created_at)
    created_at.to_s(:date)+" "+created_at.to_s(:time).gsub(/^0/,'').downcase
  end
  def display_gig(gig, disp)
    unless gig.empty?
      if disp == :short
         render "shared/gig_sm", locals: {gig:gig}
      else
         render "shared/gig_full", locals: {gig:gig}
      end
    else
     puts "Looks like you have no gigs!"
    end
  end
end
