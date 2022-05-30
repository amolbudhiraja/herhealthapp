# Her Health App
Her Health App for iOS. Developed with SwiftUI and Swift in XCode. Developed for Her Health First NPO. 

# About Her Health First
The Her Health App was developed for the Her Health First Non Profit Organization. It currently, serves as their primary medium for interaction with their mobile users. 

Her Health First is a community-based agency dedicated to providing pregnancy support. Amongst their many services includes:
* Black Mothers United: Her Health First is a community-based agency dedicated to providing pregnancy support.
* PRO Youth and Families: PRO Youth and Families is a teen pregnancy prevention program that assists youth with access to health and wellness services, resources, and more.
* IQ Squad: A program for young girls and women of color to empower and enrich them with the support to live at their fullest potential.

Her Health First NPO is located in Sacramento California. Checkout their website for more information: http://herhealthfirst.org

# Development
The Her Health App was developed using Swift and SwiftUI. Here is an overview of the key files and features that dictate the current state of the application: 
* `Notification Service` - Using the Pusher API client, we effectively integrated Push Notifications into the applications enablling communication between users and clients. Previous iterations of the Push Notifications feature leveraged the Airship Client API. 
* `BlogAPI, PodcastAPI, and VideoAPI` - Leveraging the power of Wordpress plugins, we enabled the dynamic generation of JSON feeds for every page on the Her Health First website. Accordingly, using RESTAPI's and asynchronous functions, we enabled the integration of dynamic Blog, Podcast, and Video content. Likewise, using external linking, we can also enable the users to easily access these resources both in the application and on the website. 
* `AsyncImage, EnvValImageCachce, ImageCache, ImageLoader` - To account for users' varying internet reliability and optimize application speed and loading times, we leveraged asynchronous image loading and image caches. This ensures that the images can still load despite changes in connection or state.
* `Views` - Using the power of SwiftUI and its dynamic UI configuration features, we enabled the application to adjust to varies user parameters: any device size, dark mode/light mode, dynamic text size to ensure accessibility, and more! 

# Current Release
The current release can be found on the Apple App Store: https://apps.apple.com/kz/app/her-health-app/id1581352954. 
