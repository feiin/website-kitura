import Kitura
import Middlewares
import HeliumLogger
import LoggerAPI
import Controllers
import KituraStencil
// Create a new router
let router = Router()

HeliumLogger.use()
DatabaseContext.use()

router.add(templateEngine: StencilTemplateEngine())

//use StaticFileServer
router.all("/", middleware: StaticFileServer(path: "Public", options: StaticFileServer.Options.init(), customResponseHeadersSetter: nil))

router.all(middleware: RequestLogger())
// Handle HTTP GET requests to /
router.get("/") {
    request, response, next in
    response.send("Hello, World!")
    next()
}


router.get("/articles",handler:ArticleController.List)

// Add an HTTP server and connect it to the router
Kitura.addHTTPServer(onPort: 8080, with: router)

// Start the Kitura runloop (this call never returns)
Kitura.run()
