#   Description:
# This script removes unwanted Apps that come with Windows. If you  do not want
# to remove certain Apps comment out the corresponding lines below.

$CheckFile="C:\Users\Public\store_remove"

if ($CheckFile) {continue} else {exit}

#Import-Module -DisableNameChecking $PSScr#   Description:
# This script removes unwanted Apps that come with Windows. If you  do not want
# to remove certain Apps comment out the corresponding lines below.


echo "Uninstalling default apps"
$apps = @(
    # default Windows 10 apps
    "Microsoft.3DBuilder"
    "Microsoft.BingFinance"
    "Microsoft.BingNews"
    "Microsoft.BingSports"
    "Microsoft.Getstarted"
    "Microsoft.MicrosoftOfficeHub"
    "Microsoft.MicrosoftSolitaireCollection"
    "Microsoft.Office.OneNote"
    "Microsoft.XboxApp"
    "Microsoft.ZuneMusic"
    "Microsoft.ZuneVideo"
    "Microsoft.MinecraftUWP"

    # Threshold 2 apps
    "Microsoft.CommsPhone"
    "Microsoft.ConnectivityStore"
    "Microsoft.Messaging"
    "Microsoft.Office.Sway"
    "Microsoft.OneConnect"
    "Microsoft.WindowsFeedbackHub"


    #Redstone apps
    "Microsoft.BingFoodAndDrink"
    "Microsoft.BingTravel"
    "Microsoft.BingHealthAndFitness"
    "Microsoft.WindowsReadingList"

    # non-Microsoft
    "9E2F88E3.Twitter"
    "PandoraMediaInc.29680B314EFC2"
    "Flipboard.Flipboard"
    "ShazamEntertainmentLtd.Shazam"
    "king.com.CandyCrushSaga"
    "king.com.CandyCrushSodaSaga"
    "king.com.*"
    "ClearChannelRadioDigital.iHeartRadio"
    "4DF9E0F8.Netflix"
    "6Wunderkinder.Wunderlist"
    "Drawboard.DrawboardPDF"
    "2FE3CB00.PicsArt-PhotoStudio"
    "D52A8D61.FarmVille2CountryEscape"
    "TuneIn.TuneInRadio"
    "GAMELOFTSA.Asphalt8Airborne"
    "DB6EA5DB.CyberLinkMediaSuiteEssentials"
    "Facebook.Facebook"
    "flaregamesGmbH.RoyalRevolt2"
    "Playtika.CaesarsSlotsFreeCasino"

    # apps which cannot be removed using Remove-AppxPackage
    "Microsoft.WindowsFeedback"
    "Microsoft.XboxGameCallableUI"
    "Microsoft.XboxIdentityProvider"

)




foreach ($app in $apps) {
    echo "Trying to remove $app"

    Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage

    Get-AppXProvisionedPackage -Online |
        where DisplayName -EQ $app |
        Remove-AppxProvisionedPackage -Online
}

# Prevents "Suggested Applications" returning
mkdir $CheckFile
