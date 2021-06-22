$adminSiteURL = "https://salesianer0-admin.sharepoint.com"


$themepalette = @{
"themePrimary" = "#008bd0";
"themeLighterAlt" = "#f3fafd";
"themeLighter" = "#d0eaf8";
"themeLight" = "#a9d9f1";
"themeTertiary" = "#5bb6e3";
"themeSecondary" = "#1a98d7";
"themeDarkAlt" = "#007dbc";
"themeDark" = "#006a9f";
"themeDarker" = "#004e75";
"neutralLighterAlt" = "#faf9f8";
"neutralLighter" = "#f3f2f1";
"neutralLight" = "#edebe9";
"neutralQuaternaryAlt" = "#e1dfdd";
"neutralQuaternary" = "#d0d0d0";
"neutralTertiaryAlt" = "#c8c6c4";
"neutralTertiary" = "#a19f9d";
"neutralSecondary" = "#605e5c";
"neutralPrimaryAlt" = "#3b3a39";
"neutralPrimary" = "#323130";
"neutralDark" = "#201f1e";
"black" = "#000000";
"white" = "#ffffff";
}
$themename = "Salesianer Colored Blue Theme"


Connect-sposervice $adminsiteurl
add-SPOTheme -Palette $themepalette -IsInverted $false -name $themename -overwrite

