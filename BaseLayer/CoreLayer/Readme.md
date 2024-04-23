# Core Layer: The Foundation of Modular Navigation

## Introduction

The **Core Layer** module establishes the fundamental navigation framework for your application, enabling seamless and modular navigation between different screens and modules. It employs an anchor-based approach, leveraging URLs to define routes and handle navigation. This documentation serves as a comprehensive guide for developers to effectively utilize this module.

### Key Components

The Core Layer module comprises two primary components:

- **Route Protocol**: This protocol defines the structure of a route within the navigation system. It mandates the following properties:
  - `basePath: String`: The base path for the route, such as "home" or "profile".
  - `path: String`: The specific path within the base path, such as "dashboard" or "settings".
  - `presentationMode: UIModalPresentationStyle?`: An optional `UIModalPresentationStyle` indicating how the view controller associated with the route should be presented, e.g., `.fullScreen`.
  - `component(params: Data?) -> UIViewController?`: A method responsible for creating the view controller associated with the route. It takes an optional `Data` object containing parameters and returns a `UIViewController` instance.

- **Router Protocol**: This protocol defines the functionalities for managing and executing routes:
  - `routes: [Route] { get set }`: An array of Route objects managed by the router.
  - `resolve(url: URL) -> Route?`: Takes a URL as input and attempts to find a matching route using the AnchorResolver.
  - `execute(url: URL)`: Performs the necessary navigation based on the resolved route. This might involve presenting the corresponding view controller or handling deep linking logic.

#### Example Implementation: HomeRouter

The `HomeRouter` enum exemplifies the implementation of the Route protocol:

```swift
public enum HomeRouter : Route, CaseIterable {
     case dashboard, detail
    public var basePath: String {
        return "home"
    }
    
    public var path: String {
        switch self {
        case .dashboard:
            return "dashboard"
        case .detail:
            return "detail"
        }
    }
    
    public var presentationMode: UIModalPresentationStyle? {
        switch self {
        case .dashboard:
            return nil
        case .detail:
            return nil
        }
    }
    
    @MainActor
    public func component(params: Data?) -> UIViewController? {
        switch self {
        case .dashboard:
            let props = try! JSONDecoder().decode(HomeProps.self, from: (params!))
            let provider = DIContainer.current.container.resolve(Provider.self)
            let service = RickAndMortyRepositoryAPI(provider: provider!)
            let viewModel = HomeViewModel(service: service)
            let vc = HomeViewController()
            vc.viewModel = viewModel
            return vc
        case .detail:
            let viewController = UIViewController()
            viewController.view.backgroundColor = .blue
            return viewController
        }
    }
}
```
####AppRouter Implementation
The `AppRouter` class implements the Router protocol, managing routes and handling navigation:

```swift
class AppRouter : Router {
    private var anchorResolver = AnchorResolver()
    private var navController: UINavigationController?
    var routes: [CoreLayer.Route] = []
    init(navController: UINavigationController?) {
        self.navController = navController
        routes = HomeRouter.allCases
        routes.append(DetailRouter.homeDetail)
    }
    
    func resolve(url: URL) -> Route? {
        if let route = anchorResolver.resolveUrl(url: url, routes: self.routes) {
            return route
        }
        return nil
    }
    
    func execute(url: URL) {
        let props = url.getProps()
        guard let route = self.resolve(url: url), let controller = route.component(params: props) else {
            return
        }
        
        if route.presentationMode != nil {
            self.navController?.present(controller, animated: true)
        } else {
            self.navController?.pushViewController(controller, animated: true)
        }
    }
}
```
#### AnchorResolver: URL Handling
The `AnchorResolver` class serves as the entry point for resolving URLs to their corresponding routes. It provides the following functionalities:

- `Initialization`: You can create an instance of AnchorResolver using the default initializer.
- `resolveUrl(url:routes:) -> Route?`: This method takes a URL and an array of Route objects as input. It iterates through the routes array, searching for a matching route based on the URL's host and path (converted to lowercase for case-insensitive matching). It returns the first matching Route object or nil if no match is found.

#### Creating Deep Links with createURL
For user convenience and programmatic deep linking, the AnchorResolver class offers a createURL utility function:

```swift
public static func createURL(
    host: String,
    path: String,
    props: Codable?,
    open: Bool = true
) -> URL {
  // Insert Swift code here
}
```

#### Benefits of Modular Navigation
This modular navigation approach offers several advantages:

- **Improved Maintainability**: Changes to a specific module's navigation are isolated within that module's code, making maintenance easier.
- **Enhanced Reusability**: Routes and navigation logic can be reused across different parts of the application.
- **Clear Separation of Concerns**: The separation between route definition and navigation logic promotes a cleaner architecture.
- **Flexibility**: The anchor-based approach allows for dynamic deep linking and URL handling.