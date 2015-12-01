require 'plist'

if ARGV.size < 1 
  puts "Use: #{$0} com.teklabsco.BigGulp"
  exit
end

plist = Plist::parse_xml('Prayr WatchKit App/Info.plist')
plist['CFBundleIdentifier'] = "#{ARGV[0]}.watchkitapp"
plist['WKCompanionAppBundleIdentifier'] = ARGV[0]
plist.save_plist('Prayr WatchKit App/Info.plist')

plist = Plist::parse_xml('Prayr WatchKit Extension/Prayr WatchKit Extension.entitlements')
plist['com.apple.security.application-groups'] = [ ARGV[0] ]
plist.save_plist('Prayr WatchKit Extension/Prayr WatchKit Extension.entitlements')

plist = Plist::parse_xml('Prayr/Prayr.entitlements')
plist['com.apple.security.application-groups'] = [ ARGV[0] ]
plist.save_plist('Prayr/Prayr.entitlements')

plist = Plist::parse_xml('PrayrToday/PrayrToday.entitlements')
plist['com.apple.security.application-groups'] = [ ARGV[0] ]
plist.save_plist('PrayrToday/PrayrToday.entitlements')

plist = Plist::parse_xml('Prayr/Info.plist')
plist['CFBundleIdentifier'] = ARGV[0]
plist.save_plist('Prayr/Info.plist')

plist = Plist::parse_xml('PrayrToday/Info.plist')
plist['CFBundleIdentifier'] = "#{ARGV[0]}.$(PRODUCT_NAME:rfc1034identifier)"
plist.save_plist('PrayrToday/Info.plist')

plist = Plist::parse_xml('Prayr WatchKit Extension/Info.plist')
plist['CFBundleIdentifier'] = "#{ARGV[0]}.watchkitextension"
plist['NSExtension']['NSExtensionAttributes']['WKAppBundleIdentifier'] = "#{ARGV[0]}.watchkitapp"
plist.save_plist('Prayr WatchKit Extension/Info.plist')

plist = Plist::parse_xml('PrayrTests/Info.plist')
plist['CFBundleIdentifier'] = ARGV[0]
plist.save_plist('PrayrTests/Info.plist')

