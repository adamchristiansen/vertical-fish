function vertical_reset_configuration -d 'Reset vertical prompt configuration'
  set -eU (set -U | string match -r '^vertical_[^\s]+')
  true # Always exit successfully
end
