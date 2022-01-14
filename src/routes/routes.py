from src.controllers.controllers import*
from src.controllers.errors import NotFoundController

routes = {
	"index_route": "/", "index_controller": IndexController.as_view("index"),
	"not found route": 404, "not found controlller": NotFoundController.as_view("not found")
}
