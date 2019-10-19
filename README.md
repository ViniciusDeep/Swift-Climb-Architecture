# Swift - Climb - Architeture

This architeture is inspired on [Solid](https://en.wikipedia.org/wiki/SOLID) by Uncle Bob.

Its main goal is to follow the [SOLID principles](https://en.wikipedia.org/wiki/SOLID) in order to keep the software well organised, testable, easy to maintain and more importantly easy to extend/change.

As explained in the posts above and in [the book](https://www.amazon.com/Beginning-Principles-Patterns-ASP-NET-Developers/dp/1484218477), databases, network clients and frameworks are abstracted in the off layers(Plugins) because you can reuse this components in another part of your code and should imported into app as dependecie injection to acess business and perform to Views to presentation.


![graph](
https://user-images.githubusercontent.com/32227073/66717437-65884580-edaf-11e9-895e-326fd78ff3eb.png)

## App
App is a layer of content your application, you can have many layers of apps, imagine that you have apps white label, you can use multi-target to reuse another components, in Plugins like a Service or in Reusable Layer, like a customize Cell 

### Constructor
This layer has responsible to construct your app and define and set where to go, and also  where you can make your construction configuration and navigation

### Features
Feature layer is where every feature of your app will be made with their respective layers

### Business
This layer represent the business behind each feature, to make your code more testable, your business receives by 
dependency injection another layers to connect of your app, like a Service, Repository.

### Controllers
Controller is your view and has a responsible of view, with a respective methods like a ```swift  viewDidLoad```, ```swift  viewWillAppear``` you can should to set your customView at your controller and your controller made a bind of your components


### AppTests

Even though I haven't written any tests yet, the whole project is completely testable, since all layers are being isolated by interfaces, as suggested by the SOLID principles, each feature 

## Getting Started
In Example, you can see how this Architeture works


## License

**Climb Architeture** is under MIT license. See the [LICENSE](LICENSE) file for more info.
