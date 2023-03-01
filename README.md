# ClimaSwiftUI
What I Have Implemented

I have implemented a beautiful weather app, Clima, with dark mode enabled. The app allows you to check the weather for the current location based on the GPS data from the iPhone, as well as by searching for a city manually. I have used a range of tools and technologies to create this app, including:

Swift programming language and Xcode IDE
UITextField to get user input
Delegate pattern to manage the text field
Swift protocols, extensions, guard keyword, computed properties, closures, and completion handlers
URLSession to network and make HTTP requests
JSON parsing with the native Encodable and Decodable protocols
Grand Central Dispatch to fetch the main thread
Core Location to get the current location from the phone GPS
I have also used vector images as image assets and created a condition codes switch statement to show different icons for different weather conditions.

Condition Codes
switch conditionID {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }

Thank you for checking out my ClimaSwiftUI app.
