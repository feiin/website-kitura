import Kitura
import HeliumLogger
import LoggerAPI
import KituraStencil
// Create a new router
let router = Router()

HeliumLogger.use()
DatabaseContext.use()

router.add(templateEngine: StencilTemplateEngine())

//use StaticFileServer
router.all("/", middleware: StaticFileServer(path: "Public", options: StaticFileServer.Options.init(), customResponseHeadersSetter: nil))

router.all(middleware: RequestLogger())
router.all("/",middleware: HtmlResponse())
// Handle HTTP GET requests to /
router.get("/") {
    request, response, next in
    response.send("Hello, World!")
    next()
}


router.get("/articles",handler:ArticleController.list)
router.get("/articles/:id",handler:ArticleController.detail)

// Add an HTTP server and connect it to the router
Kitura.addHTTPServer(onPort: 8080, with: router)

// Start the Kitura runloop (this call never returns)
Kitura.run()
